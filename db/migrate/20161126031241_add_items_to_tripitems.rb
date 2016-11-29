class AddItemsToTripitems < ActiveRecord::Migration[5.0]
  def change
    add_column :tripitems, :activity_name, :string
    add_column :tripitems, :location_name, :string
    add_column :tripitems, :location_url, :string
    add_column :tripitems, :activity_time, :datetime
    add_column :tripitems, :activity_address, :string
    add_column :tripitems, :activity_address_url, :string
    add_column :tripitems, :sherpa_tip, :string
    add_column :tripitems, :reservation, :string
  end
end
