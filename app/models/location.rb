class Location < ActiveRecord::Base
  attr_accessible :event_name, :start_time, :end_time, :address, :latitude, :longitude
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
