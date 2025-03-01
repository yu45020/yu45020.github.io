=begin
check whether liquid process attributes correctly without introducing newlines that break the HTML structure.

For example this code is caused by code reformatting, but the newlines break the HTML structure: 
<img
  {{  src  }}
  {{  class  }}
  {{  alt  }}
  w="1200"
  h="630"
  {{  lqip  }}>
</img>

To run this script 
rspec spec/html_structure_spec.rb
=end

require 'capybara/rspec'
require 'nokogiri'

RSpec.configure do |config|
  config.include Capybara::DSL
end


CHECKED_TAGS = %w[
  img meta link script style div span a p h1 h2 h3 h4 h5 h6 table tr td ul ol li form input button
]


describe 'HTML structure' do
    Dir.glob('_site/**/*.html').each do |file|
      context "checking #{file}" do
        it 'does not break the HTML with new lines' do
          html_content = File.read(file)
          doc = Nokogiri::HTML(html_content)
          CHECKED_TAGS.each do |tag|
            # check for HTML parsing errors 
            doc.css(tag).each do |element|
              case tag
              when 'img'
                expect(element['src']).to_not be_nil, "Missing src attribute in #{file}: #{element}"
                expect(element['alt']).to_not be_nil, "Missing alt attribute in #{file}: #{element}"
              when 'a'
                expect(element['href']).to_not be_nil, "Missing href attribute in #{file}: #{element}"
              when 'meta', 'link'
                expect(element['content']).to_not be_nil, "Missing content attribute in #{file}" if element['name']
              when 'form'
                expect(element['action']).to_not be_nil, "Missing action attribute in #{file}"
              when 'input'
                expect(element['type']).to_not be_nil, "Missing type attribute in #{file}"
              end
              # check whether line breaks in tag
              element_str = element.to_s[/<#{tag}[^>]*>/]
              if element_str.match(/<#{tag}[^>]*=\s*"\s*\n\s*[^"]*"/)
                puts "⚠️  Potential Liquid break in #{file}:"
                puts element_str.lines.first.strip
                # raise "tag broken in #{file}"
              end
            end
          end

          # ch
  
        end
      end
    end
  end
