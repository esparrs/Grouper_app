class Place < ActiveRecord::Base
  has_many :events
  attr_accessible :description, :latitude, :longitude, :name, :string
  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, :reverse_geocode
end
