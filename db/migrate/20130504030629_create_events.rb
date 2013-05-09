class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :start
      t.datetime :end
      t.references :place
      t.string :description

      t.timestamps
    end
    add_index :events, :place_id
  end
end
