class Event < ActiveRecord::Base
  belongs_to :place
  attr_accessible :description, :end, :name, :start, :other, :date, :place_id
end
