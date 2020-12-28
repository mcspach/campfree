# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

Trip.destroy_all
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
  ]
)

avatar1 = URI.open('https://images.unsplash.com/photo-1566827713505-6af1f50028e9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1494&q=80')
User.first.photo.attach(io: avatar1, filename: 'A.png', content_type: 'image/png')
avatar2 = URI.open('https://images.unsplash.com/photo-1598966739654-5e9a252d8c32?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80')
User.last.photo.attach(io: avatar2, filename: 'B.png', content_type: 'image/png')


puts "User Created!"

site_1 = Site.create!(
  title: "Beautiful woodsy camp in NorCal",
  address: "20334 Saticoy St, Winnetka, California, 91306",
  state: "California",
  description: "This quaint little camp in the woods is perfect for a weekend getaway. It comes with firepit, chairs and a lovely view of the valley from an elevated position.",
  price: 150.00,
  user_id: User.all.sample.id 
)

site_2 = Site.create!(
  title: "Cute traditional tent by the lake",
  address: "100 Dugway Rd, Waitsfield, Vermont, 05673",
  state: "Vermont",
  description: "We have been camping at this beautiful spot for the last 20 years. Come year to relax, unplug and enjoy the serenity overlooking a natural lake with plenty of salmon and bluegill trout.",
  price: 40.00,
  user_id: User.all.sample.id
)

site_3 = Site.create!(
  title: "Unique weekend getaway sleeps 4",
  address: "72518 240th St, Dassel, Minnesota, 55325",
  state: "Minnesota",
  description: "The perfect camp for novist campers. This camp comes with all the amenities in case you are looking for a short weekend away from Denver - it includes fully equipped outdoor bathroom and shower.",
  price: 10.00,
  user_id: User.all.sample.id
)

site_4 = Site.create!(
  title: "Awesome couple retreat site",
  address: "910 Sagewood Dr, South Lake Tahoe, California, 96150",
  state: "California",
  description: "Stylish camp getaway located in the mountains just 15 miles from Lake Tahoe. This is a perfect little hut for the city dweller",
  price: 100.00,
  user_id: User.all.sample.id
)

site_5 = Site.create!(
  title: "The windbreaker in the woods",
  address: "21 Decker Rd, Sheridan, Wyoming, 82801",
  state: "Wyoming",
  description: "This adventure's tent is perfect for the expert camper who is looking for some adventured and the rugged beauty that Jackson Holes has to offer. Perched on a cliff, you will get stunning views of the valley and a clean burst of fresh air.",
  price: 35.00,
  user_id: User.all.sample.id
)

site_6 = Site.create!(
  title: "Lovely little forest escape",
  address: "8645 Saint James Ave, Elmhurst, New York, 11373",
  state: "New York",
  description: "This is a really authentic little tend perfect for a weekend getaway with friends or your romantic partner. It is in excellent condition with full amenities so all you need to bring is yourself!",
  price: 74.00,
  user_id: User.all.sample.id
)

site_7 = Site.create!(
  title: "Beachmaster wave-riders camp",
  address: "487 E Middlefield Rd, Mountain View, California, 94043",
  state: "California",
  description: "This is the perfect getwaway for the surfer who is looking for a weekend of shredding waves and pumping beers. You will get a perfect view of the sunset over the ocean with amazing wildlife surrounding.",
  price: 90.00,
  user_id: User.all.sample.id
)

site_8 = Site.create!(
  title: "Barnyard Boogiewoogie",
  address: "313 Lake Placid Loop, Valley, Alabama, 36854",
  state: "Alabama",
  description: "This is the perfect getwaway for the grimy dudes and peeps who is looking for a weekend of shredding beef and pumping beers. You will get a perfect view of the sunset over the barn with amazing fields surrounding.",
  price: 40.00,
  user_id: User.all.sample.id
)

site_9 = Site.create!(
  title: "Social Campsites near Yellowstone",
  address: "727 Big Horn Ave, Sheridan, Wyoming, 82801",
  state: "Wyoming",
  description: "Only an hour drive to the heart of Yellowstone, we have set up a great place to hang out with the other campers and prepare for exploring the area.",
  price: 29.00,
  user_id: User.all.sample.id
)

file1 = URI.open('https://images.unsplash.com/photo-1537225228614-56cc3556d7ed?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80')
site_1.photos.attach(io: file1, filename: '1.png', content_type: 'image/png')
file2 = URI.open('https://images.unsplash.com/photo-1508873696983-2dfd5898f08b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80')
site_2.photos.attach(io: file2, filename: '2.png', content_type: 'image/png')
file3 = URI.open('https://images.unsplash.com/photo-1508266822900-0640fd19e392?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80')
site_3.photos.attach(io: file3, filename: '3.png', content_type: 'image/png')
file4 = URI.open('https://images.unsplash.com/photo-1525811902-f2342640856e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80')
site_4.photos.attach(io: file4, filename: '4.png', content_type: 'image/png')
file5 = URI.open('https://images.unsplash.com/photo-1542332213-1d277bf3d6c6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80')
site_5.photos.attach(io: file5, filename: '5.png', content_type: 'image/png')
file6 = URI.open('https://images.unsplash.com/photo-1604906145393-5d0fdd5a199a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80')
site_6.photos.attach(io: file6, filename: '6.png', content_type: 'image/png')
file7 = URI.open('https://images.unsplash.com/photo-1534507658483-02cfca87f13f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80')
site_7.photos.attach(io: file7, filename: '7.png', content_type: 'image/png')
file8 = URI.open('https://images.unsplash.com/photo-1489176876421-3b720db0fb3d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80')
site_8.photos.attach(io: file8, filename: '8.png', content_type: 'image/png')
file9 = URI.open('https://images.unsplash.com/photo-1487730116645-74489c95b41b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80')
site_9.photos.attach(io: file9, filename: '9.png', content_type: 'image/png')


puts "9 Sites Created!"