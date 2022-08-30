require "open-uri"
require "json"
require "nokogiri"

# User.create(email: "email2@example.com",
#             password: "1234566",
#             title: "Mr",
#             first_name: "Andrei",
#             last_name: "Badea"
#           )

url = "https://www.veranda.com/travel/g30083514/beautiful-castles-in-the-world/"
user_serialized = URI.open(url).read
# user = JSON.parse(user_serialized)
html_doc = Nokogiri::HTML(user_serialized)

html_doc.search(".listicle-slide").each_with_index do |element, index|
  castle_name = element.search(".listicle-slide-hed-text").text.strip.split(" in")[0]
  address = element.search(".listicle-slide-hed-text").text.split(" in")[1].strip
  image_wrapper = element.search(".slide-image-wrap source")
  image_url_attribute = image_wrapper.attribute("data-srcset") || image_wrapper.attribute("srcset")
  image_url = image_url_attribute.value.split("?")[0]
  puts "#{index + 1}. Castle name: #{castle_name}"
  puts "Address: #{address}"
  puts "Image URL: #{image_url}"
  puts "Capacity: #{rand(5..25)*10}"
  puts "Has Internet: #{[true, false].sample}"
  puts "Has Butlers: #{[true, false].sample}"
  puts "Has Swimming Pool: #{[true, false].sample}"
  puts "Has Horses: #{[true, false].sample}"
  puts "Price: #{rand(15..60)*1000}"
  puts "host_id:#{rand(4..7)}"


end

# puts html_doc
