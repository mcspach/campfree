The current release of this web-app is usually found at 
https://campfree.herokuapp.com/

----------
You may use this demo user to sign in, if you don't want to spend the time to create your own profile:

email: bob@example.com
password: 123456

------------

When you clone the app to your local machine, run this series of commands in the Terminal:

Check your versions of Ruby and Rails with
$ ruby -v
$ rails -v

If you don't have rails installed go to here 
http://www.installrails.com/

-------------
Then run::::: All these::::

$ bundle install
$ rails db:create db:migrate db:seed
$ rails s 
 -this will open a local server of the app on your computer. You can close it with ctrl-C
 
 At that point you should be good to open a new branch and code
 
------------

Right now, the map only appears on show page for each campsite.
Eventually we would like a map on the homepage as well.
We are currently only displaying things that actually geocode, but we need a way to auto-complete addresses and only accept the ones that can geocode.
Alternatively the user should be able to place a marker on the map. We don't have that functionality yet.

Mapbox stuff is in a few different spots, but the majority is in app/javascript/plugins/init_mapbox.js

---------


This is a Ruby on Rails application, started with the help of students from Le Wagon Mexico batch #483.
