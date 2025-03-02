#!/usr/bin/env ruby
require 'nokogiri'
require 'uri'



# fix preview 
Jekyll::Hooks.register :pages, :post_render do |page|
  next unless  page.name =="index.html"
  Jekyll.logger.info "\n 📖 Processing page After Rendering: #{page.url}"
  # only correct the preview image
  replace_preview_image_link(page)
  puts "=" * 50
end

# fix images in the body 
Jekyll::Hooks.register :posts, :post_render do |post|
  next if post.output.nil? || post.output.strip.empty?  # Skip empty posts
  Jekyll.logger.info "\n 📖 Processing Post After Rendering: #{post.url}"
  replace_internal_links(post)
  puts "=" * 50
end 



def replace_internal_links(post)
    html = post.output 
    site = post.site 
    post_folder_in_site = post.url
    source_folder = File.dirname(post.path)
    doc = Nokogiri::HTML::parse(html)

    # main_content = doc.at_css('main[aria-label="Main Content"]')
    # puts "Preview img: #{preview_img }" if preview_img
    main_content =  doc.at_css("article") 
    main_content.css('a').each do |link|
      href = link['href']
      next unless href  

      # puts "Original href: #{href}"
      if internal_link?(href, site)
          base_href, anchor = href.split('#', 2)
          # puts "Base href: #{base_href}, Anchor: #{anchor}" 

          file_name = File.basename(base_href)

          # find the matching post 
          linked_post = site.posts.docs.find { |p| p.path.end_with?(file_name)} ||
                site.posts.docs.find { |p| p.path.end_with?("#{file_name}.md") } || 
                site.posts.docs.find { |p| p.path.end_with?("#{file_name}.markdown") }

          # find the matching files in the same folder of the post as they are moved to the same folder
          target_file = File.join(post_folder_in_site, file_name)
          source_file = File.join(source_folder, file_name)
       
        if linked_post 
          Jekyll.logger.info "✅ Matched post: #{linked_post.path} -> #{linked_post.url}"  
          link['href'] = anchor ? "#{linked_post.url}##{anchor}" :  linked_post.url
        elsif File.exist?(source_file)  
          Jekyll.logger.info "✅ Matched file: #{source_file} -> #{target_file}"
          link['href'] = anchor ? "#{target_file}##{anchor}" : target_file
          # replace all src under the <a> <...> </a>
          link.css('*[src]').each do |sub_element|
            old_src = sub_element['src']
            next if old_src.nil? || old_src.start_with?("http") # , "/", "assets"
            sub_element['src'] = target_file
          end
        else
          # Jekyll.logger.info "❌ No matching post found for: #{base_href}, #{target_file} "  
        end
      end
    end
    post.output = doc.to_html  
end

def internal_link?(href, site)
  return false if href.start_with?('#')  # Ignore anchor links
  return false if href.start_with?('mailto:')  # Ignore email links
  return false if href.start_with?('http://', 'https://') && !href.start_with?(site.config['url'])

  # It's internal if it starts with `/` or doesn't have `http/https`
  href.start_with?('/') || !href.match?(/^https?:\/\//)
end
 





def replace_preview_image_link(post)
  html = post.output 
  site = post.site 
  source_folder = File.dirname(post.path)
  doc = Nokogiri::HTML::parse(html)
  # main_content = doc.at_css('main[aria-label="Main Content"]')
  main_content =  doc.at_css("div#post-list")
  main_content.css('div.preview-img').each do |div|
    img = div.at_css("img")
    next unless img  

    src = img['data-src']
    next unless src
    if internal_link?(src, site)
        parent_link = img.at_xpath('ancestor::a[1]')
        next unless parent_link
        post_url = parent_link['href']

        target_file = File.join(post_url, File.basename(src))
        # we assume the target file is in posts/post folder
        puts "📄 Matched file: #{src} -> #{target_file}"
        img['data-src'] = target_file
    end
  end
  puts "--- Finished Processing ---\n"
  post.output = doc.to_html  
end