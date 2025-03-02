# move files without correct naming pattern in the _posts/ folder to /posts/YYYY-MM-DD-<folder-name>/
# Jekyll process the files 

module Jekyll
  class PostFilenameFixer < Generator
    safe true
    priority :highest  # Ensure this runs before constructing site.posts

    def generate(site)
      posts_dir = File.join(site.source, site.config['posts_dir'] || '_posts')
      Dir.glob("#{posts_dir}/**/*").each do |file_path|
        # loop over markdown files that are not in site.posts 
        next unless File.file?(file_path) && ['.md', '.markdown'].include?(File.extname(file_path))
        next if site.posts.docs.any? { |post| post.path == file_path }

        filename_without_ext = File.basename(file_path, File.extname(file_path))
        file_time = get_best_file_date(file_path)

        normalized_path = file_path.gsub('\\', '/')

        if normalized_path.match(%r{/_posts/(.+?)/})
          relative_folder = "/posts/#{file_time}-#{$1}"    
        else
          relative_folder = "/posts/#{file_time}"    
        end

      
        FileUtils.mkdir_p(relative_folder)

        next if site.posts.docs.any? { |post| post.path == file_path }

    
        Jekyll.logger.warn "Virtual Rename:", "#{file_path}"
        post = Jekyll::Document.new(file_path,  site: site, collection: site.posts)

        post.read()
        post.data['layout'] =  "post"
        post.data['permalink'] = "/#{relative_folder}/#{filename_without_ext}/"

        site.posts.docs << post

       end
    end

    def get_best_file_date(file_path)
      # Prefer birthtime (file creation time)
      if File.respond_to?(:birthtime)
        begin
          return File.birthtime(file_path).strftime('%Y-%m-%d')
        rescue
        end
      end

      # Use last modification time if birthtime is not available
      begin
        return File.mtime(file_path).strftime('%Y-%m-%d')
      rescue
      end

      # Use last change time if mtime is not available
      begin
        return File.ctime(file_path).strftime('%Y-%m-%d')
      rescue
        nil  # If all else fails, return nil
      end
    end
  end
end