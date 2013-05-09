class AddOtherToEvents < ActiveRecord::Migration
  def change
    add_column :events, :other, :string
  end
end
