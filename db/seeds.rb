require "open-uri"
require "json"
require "nokogiri"

url = "https://www.veranda.com/travel/g30083514/beautiful-castles-in-the-world/"
user_serialized = URI.open(url).read
# user = JSON.parse(user_serialized)
html_doc = Nokogiri::HTML(user_serialized)

html_doc.search(".listicle-slide").each_with_index do |element, index|
  castle_name = element.search(".listicle-slide-hed-text").text.strip.split(" in")[0]
  castle_address = element.search(".listicle-slide-hed-text").text.split(" in")[1].strip
  image_wrapper = element.search(".slide-image-wrap source")
  image_url_attribute = image_wrapper.attribute("data-srcset") || image_wrapper.attribute("srcset")
  image_url = image_url_attribute.value.split("?")[0]

  Castle.create(host_id: User.ids.sample,
                name: castle_name,
                address: castle_address,
                image_url: image_url,
                price: rand(15..60)*1000,
                has_internet: [true, false].sample,
                has_butlers: [true, false].sample,
                has_swimming_pool: [true, false].sample,
                has_horses:[true, false].sample,
                capacity: rand(5..25)*10
               )
end
