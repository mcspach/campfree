# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

User.destroy_all

User.create(
  [
    {
      username: "Ann",
      email: "ann@example.com",
      password: "123456"
    },
    {
      username: "Bobby",      
      email: "bob@example.com",
      password: "123456"
    },
    {
      username: "Charlie",
      email: "charlie@example.com",
      password: "123456"
    }
  ]
)

puts "User Created!"

tent_1 = Tent.create!(
  title: "Beautiful camp in the woods of Montana",
  address: "20334 Saticoy St, Winnetka, California, 91306",
  state: "California",
  description: "This quaint little camp in the woods is perfect for a weekend getaway. It comes with firepit, chairs and a lovely view of the valley from an elevated position.",
  price: 150.00,
  user_id: User.all.sample.id 
)

tent_2 = Tent.create!(
  title: "Super cute traditional tent overlooking lake",
  address: "100 Dugway Rd, Waitsfield, Vermont, 05673",
  state: "Vermont",
  description: "We have been camping at this beautiful spot for the last 20 years. Come year to relax, unplug and enjoy the serenity overlooking a natural lake with plenty of salmon and bluegill trout.",
  price: 40.00,
  user_id: User.all.sample.id
)

tent_3 = Tent.create!(
  title: "Snowy camping tent great for a romantic getaway",
  address: "72518 240th St, Dassel, Minnesota, 55325",
  state: "Minnesota",
  description: "The perfect camp for novist campers. This camp comes with all the amenities in case you are looking for a short weekend away from Denver - it includes fully equipped outdoor bathroom and shower.",
  price: 10.00,
  user_id: User.all.sample.id
)

tent_4 = Tent.create!(
  title: "Awesome couple getaway",
  address: "1355 Glen Eagles Rd, South Lake Tahoe, California, 96150",
  state: "California",
  description: "Stylish camp getaway located in the mountains just 15 miles from Lake Tahoe. This is a perfect little hut for the city dweller",
  price: 100.00,
  user_id: User.all.sample.id
)

tent_5 = Tent.create!(
  title: "The windbreaker in the woods",
  address: "9 Longbow Ln, Pinedale, Wyoming, 82941",
  state: "Wyoming",
  description: "This adventure's tent is perfect for the expert camper who is looking for some adventured and the rugged beauty that Jackson Holes has to offer. Perched on a cliff, you will get stunning views of the valley and a clean burst of fresh air.",
  price: 35.00,
  user_id: User.all.sample.id
)

tent_6 = Tent.create!(
  title: "Lovely little tent in the forrest",
  address: "8645 Saint James Ave, Elmhurst, New York, 11373",
  state: "New York",
  description: "This is a really authentic little tend perfect for a weekend getaway with friends or your romantic partner. It is in excellent condition with full amenities so all you need to bring is yourself!",
  price: 74.00,
  user_id: User.all.sample.id
)

tent_7 = Tent.create!(
  title: "Beachmaster camp for the wave rider",
  address: "487 E Middlefield Rd, Mountain View, California, 94043",
  state: "California",
  description: "This is the perfect getwaway for the surfer who is looking for a weekend of shredding waves and pumping beers. You will get a perfect view of the sunset over the ocean with amazing wildlife surrounding.",
  price: 150.00,
  user_id: User.all.sample.id
)

file1 = URI.open('https://images.unsplash.com/photo-1445308394109-4ec2920981b1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=60')
tent_1.photos.attach(io: file1, filename: '1.png', content_type: 'image/png')
file2 = URI.open('https://images.unsplash.com/photo-1539022778322-f3fbeb6d32f2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=60')
tent_2.photos.attach(io: file2, filename: '2.png', content_type: 'image/png')
file3 = URI.open('https://images.unsplash.com/photo-1604093999627-d7dcbc5d3301?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=60')
tent_3.photos.attach(io: file3, filename: '3.png', content_type: 'image/png')
file4 = URI.open('https://images.unsplash.com/photo-1598954467835-3b0b6fe3be70?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=60')
tent_4.photos.attach(io: file4, filename: '4.png', content_type: 'image/png')
file5 = URI.open('https://images.unsplash.com/photo-1544239649-4238bf7bd7d5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=60')
tent_5.photos.attach(io: file5, filename: '5.png', content_type: 'image/png')
file6 = URI.open('https://images.unsplash.com/photo-1604906145393-5d0fdd5a199a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=60')
tent_6.photos.attach(io: file6, filename: '6.png', content_type: 'image/png')
file7 = URI.open('https://images.unsplash.com/photo-1534507658483-02cfca87f13f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=60')
tent_7.photos.attach(io: file7, filename: '7.png', content_type: 'image/png')


puts "Tent Created!"