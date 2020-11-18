# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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
  location: "Helena, Montana",
  description: "This quaint little camp in the woods is perfect for a weekend getaway. It comes with firepit, chairs and a lovely view of the valley from an elevated position.",
  price: 150.00,
  user_id: User.all.sample.id 
)

tent_2 = Tent.create!(
  title: "Super cute traditional tent overlooking lake",
  location: "Portsmouth, Maine",
  description: "We have been camping at this beautiful spot for the last 20 years. Come year to relax, unplug and enjoy the serenity overlooking a natural lake with plenty of salmon and bluegill trout.",
  price: 240.00,
  user_id: User.all.sample.id
)

tent_3 = Tent.create!(
  title: "Snowy camping tent great for a romantic getaway",
  location: "Utah, Colorado",
  description: "The perfect camp for novist campers. This camp comes with all the amenities in case you are looking for a short weekend away from Denver - it includes fully equipped outdoor bathroom and shower.",
  price: 10.00,
  user_id: User.all.sample.id
)

tent_4 = Tent.create!(
  title: "Lovely couple getaway in the mountains",
  location: "Lake Tahoe, California",
  description: "Stylish camp getaway located in the mountains just 15 miles from Lake Tahoe. This is a perfect little hut for the city dweller",
  price: 100.00,
  user_id: User.all.sample.id
)

tent_5 = Tent.create!(
  title: "The windbreaker in the woods",
  location: "Jackson Holes, Wyoming",
  description: "This adventure's tent is perfect for the expert camper who is looking for some adventured and the rugged beauty that Jackson Holes has to offer. Perched on a cliff, you will get stunning views of the valley and a clean burst of fresh air.",
  price: 1000.00,
  user_id: User.all.sample.id
)

tent_6 = Tent.create!(
  title: "Lovely little tent in the forrest",
  location: "Catsills, NY",
  description: "This is a really authentic little tend perfect for a weekend getaway with friends or your romantic partner. It is in excellent condition with full amenities so all you need to bring is yourself!",
  price: 300.00,
  user_id: User.all.sample.id
)

tent_7 = Tent.create!(
  title: "Beachmaster camp for the wave rider",
  location: "Baja, California",
  description: "This is the perfect getwaway for the surfer who is looking for a weekend of shredding waves and pumping beers. You will get a perfect view of the sunset over the ocean with amazing wildlife surrounding.",
  price: 150.00,
  user_id: User.all.sample.id
)

puts "Tent Created!"