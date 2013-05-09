class RemoveaAddressFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :address
    add_column :places, :address, :string
  end
end
