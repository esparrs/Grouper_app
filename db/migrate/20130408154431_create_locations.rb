class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.string :event_name
      t.datetime :start_time
      t.datetime :end_time
      t.string :address
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end