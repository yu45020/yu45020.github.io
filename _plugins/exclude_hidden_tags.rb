module Jekyll
    class ExcludeHiddenPosts < Generator
      safe true
      priority :high  # Ensure it runs early
  
      def generate(site)
        filtered_tags = Hash.new { |hash, key| hash[key] = [] }
  
        site.posts.docs.each do |post|
          if post.data["hidden"] != true  # Only include posts where hidden is not true
            post.data["tags"]&.each do |tag|
              filtered_tags[tag] << post
            end
          end
        end
  
        site.config["filtered_tags"] = filtered_tags
      end
    end
  end
  