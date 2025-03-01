#!/usr/bin/env ruby
 
require 'fileutils'

Jekyll::Hooks.register :posts, :post_write  do |post|
  # move all files in the _post's folder to the same post folder in posts/

  source_posts_dir = "_posts"
  # Extract the post's source directory
  post_source_folder = File.dirname(post.path) 
  puts "post.path: #{post.path}, post_source_folder: #{post_source_folder}"
  if File.expand_path(post_source_folder) == File.expand_path(source_posts_dir)
    puts "⏭️ Skipping image move for standalone post: #{post.path}"
    next
  end

  # same target folder as the post 
  target_folder = File.join(post.site.dest, post.url)  

  # no need to create the folder, Jekyll will do it
  # FileUtils.mkdir_p(target_folder)

  puts "\n📂 Moving images from `#{post_source_folder}` to `/#{target_folder}/`...\n"

  # Move all images and non-Markdown files from the original post folder
  Dir.glob(File.join(post_source_folder, "*")).each do |file|
    next if file.end_with?(".md") || file.end_with?(".markdown")  

    filename = File.basename(file)
    target_path = File.join(target_folder, filename)

    FileUtils.cp(file, target_path)  
    puts "✅ Moved: #{file} → #{target_path}"
  end

  puts "\n✅ Image and file move complete!\n"
end