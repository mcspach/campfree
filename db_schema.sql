CREATE SCHEMA campfree; -- all data related to our campsites will be stored here

-- user_campsites will be campsites entered in by our users
CREATE TABLE campfree.user_campsites (
  id serial NOT NULL, -- unique id
  name varchar(100) NOT NULL, -- name of campesite (USER WILL ENTER THIS IN FORM)
  type varchar(10), -- type of site (public land, private land, nationl park land, etc) - spatial query on boundaries
  description varchar(500) NOT NULL, -- description of the site by the user (USER WILL ENTER THIS IN FORM)
  photo varchar, -- API link ? (USER WILL ENTER THIS IN FORM)
  price double precision, -- (USER WILL ENTER THIS IN FORM) ?
  state_id integer NOT NULL, -- this will link to the states table
  city_id integer NOT NULL, -- this will link to the cities table
  address varchar(100), -- maybe use geocode here if it's a free campsite at someones house?
  lat double precision NOT NULL, -- latitude taken from map
  long double precision NOT NULL, -- longitude taken from map
  elevation double precision, -- elevation taken from map
  create_user_id integer NOT NULL, -- the user id (from users table) who created the campsite
  create_timestmap datetime NOT NULL, -- timestmap for initial creation of campsite
  last_update_user_id integer NOT NULL, -- the user id (from users table) who last updated the table
  last_update_timestamp datetime NOT NULL, -- timestmap for last updated campsite
  active_flag bit NOT NULL -- this is a 0 or 1 flag defining whether the campsite should be displayed on not
);
-- need to add a geom column into the database (postgis must be enabled)
SELECT AddGeometryColumn('campsites', 'wkb_geometry', 3725, 'POINT', 3 );

-- Index: user_campsites_geom_idx
CREATE INDEX user_campsites_geom_idx
  ON user_campsites
  USING gist
  (wkb_geometry);

-- external_campsites will be campsites that we grab from other public sources
CREATE TABLE campfree.external_campsites (
  id serial NOT NULL,
  name varchar(100) NOT NULL,
  description varchar(500),
  state_id integer NOT NULL, -- this will link to the states table
  lat double precision NOT NULL,
  long double precision NOT NULL,
  create_user_id integer NOT NULL, -- the user id (from users table) who created the record
  create_timestmap datetime NOT NULL, -- timestmap for initial creation of record
  last_update_user_id integer NOT NULL, -- the user id (from users table) who last updated the record
  last_update_timestamp datetime NOT NULL, -- timestmap for last updated record
  active_flag bit NOT NULL -- this is a 0 or 1 flag defining whether the record should be displayed on not
);

-- need to add a geom column into the database (postgis must be enabled)
SELECT AddGeometryColumn('external_campsites', 'wkb_geometry', 4326, 'POINT', 2);

-----------
-- all external data (national park boundaries, state boundaries, rivers maybe?, external_campsites) will be stored here
CREATE SCHEMA basemap;

-- states will be polygons - we can use these to determine if a campsite is within a state boundary
CREATE TABLE basemap.states (
  id serial NOT NULL,
  name varchar(100) NOT NULL,
  create_user_id integer NOT NULL, -- the user id (from users table) who created the record
  create_timestmap datetime NOT NULL, -- timestmap for initial creation of record
  last_update_user_id integer NOT NULL, -- the user id (from users table) who last updated the record
  last_update_timestamp datetime NOT NULL, -- timestmap for last updated record
  active_flag bit NOT NULL, -- this is a 0 or 1 flag defining whether the record should be displayed on not
);

-- need to add a geom column into the database (postgis must be enabled)
SELECT AddGeometryColumn('states', 'wkb_geometry', 4326, 'POLYGON', 2);

-- cities will be polygons - we can use these to determine if a campsite is within a city boundary
CREATE TABLE basemap.cities (
  id serial NOT NULL,
  name varchar(100) NOT NULL,
  create_user_id integer NOT NULL, -- the user id (from users table) who created the record
  create_timestmap datetime NOT NULL, -- timestmap for initial creation of record
  last_update_user_id integer NOT NULL, -- the user id (from users table) who last updated the record
  last_update_timestamp datetime NOT NULL, -- timestmap for last updated record
  active_flag bit NOT NULL, -- this is a 0 or 1 flag defining whether the record should be displayed on not
);

-- need to add a geom column into the database (postgis must be enabled)
SELECT AddGeometryColumn('cities', 'wkb_geometry', 4326, 'POLYGON', 2);

-- national_parks will be polygons - we can use these to determine if a campsite is within a park boundary
CREATE TABLE basemap.national_parks (
  id serial NOT NULL,
  name varchar(100) NOT NULL,
  create_user_id integer NOT NULL, -- the user id (from users table) who created the record
  create_timestmap datetime NOT NULL, -- timestmap for initial creation of record
  last_update_user_id integer NOT NULL, -- the user id (from users table) who last updated the record
  last_update_timestamp datetime NOT NULL, -- timestmap for last updated record
  active_flag bit NOT NULL -- this is a 0 or 1 flag defining whether the record should be displayed on not
);

-- need to add a geom column into the database (postgis must be enabled)
SELECT AddGeometryColumn('national_parks', 'wkb_geometry', 4326, 'POLYGON', 2);

-- national_forests will be polygons - we can use these to determine if a campsite is within a forest boundary
CREATE TABLE basemap.national_forests (
  id serial NOT NULL,
  name varchar(100) NOT NULL,
  create_user_id integer NOT NULL, -- the user id (from users table) who created the record
  create_timestmap datetime NOT NULL, -- timestmap for initial creation of record
  last_update_user_id integer NOT NULL, -- the user id (from users table) who last updated the record
  last_update_timestamp datetime NOT NULL, -- timestmap for last updated record
  active_flag bit NOT NULL, -- this is a 0 or 1 flag defining whether the record should be displayed on not
);

-- need to add a geom column into the database (postgis must be enabled)
SELECT AddGeometryColumn('national_forests', 'wkb_geometry', 4326, 'POLYGON', 2);

-- indian_lands will be polygons - we can use these to determine if a campsite is within a indian land boundary
CREATE TABLE basemap.indian_lands (
  id serial NOT NULL,
  name varchar(100) NOT NULL,
  create_user_id integer NOT NULL, -- the user id (from users table) who created the record
  create_timestmap datetime NOT NULL, -- timestmap for initial creation of record
  last_update_user_id integer NOT NULL, -- the user id (from users table) who last updated the record
  last_update_timestamp datetime NOT NULL, -- timestmap for last updated record
  active_flag bit NOT NULL -- this is a 0 or 1 flag defining whether the record should be displayed on not
);

-- need to add a geom column into the database (postgis must be enabled)
SELECT AddGeometryColumn('indian_lands', 'wkb_geometry', 4326, 'POLYGON', 2);

-- public_lands will be polygons - we can use these to determine if a campsite is within a public land boundary
CREATE TABLE basemap.public_lands (
  id serial NOT NULL,
  name varchar(100) NOT NULL, -- name of boundary
  create_user_id integer NOT NULL, -- the user id (from users table) who created the record
  create_timestmap datetime NOT NULL, -- timestmap for initial creation of record
  last_update_user_id integer NOT NULL, -- the user id (from users table) who last updated the record
  last_update_timestamp datetime NOT NULL, -- timestmap for last updated record
  active_flag bit NOT NULL -- this is a 0 or 1 flag defining whether the record should be displayed on not
);

-- need to add a geom column into the database (postgis must be enabled)
SELECT AddGeometryColumn('public_lands', 'wkb_geometry', 4326, 'POLYGON', 2);

-----------

-- any user information will be stored here
CREATE SCHEMA users;

-- user information will be stored here
CREATE TABLE users.user (
  id serial NOT NULL,
  first_name varchar(100) NOT NULL, -- (USER WILL ENTER THIS IN FORM)
  last_name varchar(100) NOT NULL, -- (USER WILL ENTER THIS IN FORM)
  email varchar(100) NOT NULL, -- (USER WILL ENTER THIS IN FORM)
  username varchar(100) NOT NULL, -- (USER WILL ENTER THIS IN FORM)
  password text NOT NULL, -- (USER WILL ENTER THIS IN FORM)
  salt text NOT NULL,
  state_id integer NOT NULL, -- this will link to the states table (USER WILL ENTER THIS IN FORM) - we can have a drop down
  city_id integer NOT NULL, -- this will link to the states table  (USER WILL ENTER THIS IN FORM) - we can have a drop down
  create_user_id integer NOT NULL, -- the user id (from users table) who created the record
  create_timestmap datetime NOT NULL, -- timestmap for initial creation of record
  last_update_user_id integer NOT NULL, -- the user id (from users table) who last updated the record
  last_update_timestamp datetime NOT NULL, -- timestmap for last updated record
  active_flag bit NOT NULL -- this is a 0 or 1 flag defining whether the record should be displayed on not
);
