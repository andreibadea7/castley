require "json"
require "open-uri"
require "nokogiri"

url = 'https://www.veranda.com/travel/g30083514/beautiful-castles-in-the-world/'
user_serialized = URI.open(url).read
# user = JSON.parse(user_serialized)
html_doc = Nokogiri::HTML(user_serialized)

html_doc.search(".listicle-slide").each do |element|
  castle_name = element.search(".listicle-slide-hed-text").text.strip.split(" in")[0]
  castle_address = element.search(".listicle-slide-hed-text").text.split(" in")[1].strip
  image_wrapper = element.search(".slide-image-wrap source")
  image_url_attribute = image_wrapper.attribute("data-srcset") || image_wrapper.attribute("srcset")
  image_url = image_url_attribute.value.split("?")[0]

  Castle.create(host_id: User.ids.sample,
                name: castle_name,
                address: castle_address,
                image_url: image_url,
                price: rand(15..60) * 1000,
                has_internet: [true, false].sample,
                has_butlers: [true, false].sample,
                has_swimming_pool: [true, false].sample,
                has_horses: [true, false].sample,
                capacity: rand(5..25) * 10)
end

10.times do
  check_in = Date.new(rand(2015..2021), rand(1..12), rand(1..28))
  check_out = check_in + rand(1..100)
  Reservation.create(
    check_in: check_in,
    check_out: check_out,
    total_price: rand(5000..50000) * (check_out - check_in),
    guest_id: User.all.sample.id,
    castle_id: Castle.all.sample.id
  )
end

# reservations_without_ids = Reservation.all.ids - Review.all.pluck(:reservation_id)

# reservations_without_ids.count.times do
#   Review.create(
#     reservation_id: reservations_without_ids.sample,
#     rating: rand(1..5),
#     comment: "Nice one"
#   )
# end
