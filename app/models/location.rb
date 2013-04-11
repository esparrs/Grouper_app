class Location < ActiveRecord::Base
  attr_accessible :event_name, :start_time, :end_time, :address, :latitude, :longitude
  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, :reverse_geocode
end
