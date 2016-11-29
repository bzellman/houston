class AddDetailsToTrip < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :first_name, :string
    add_column :trips, :last_name, :string
    add_column :trips, :trip_message, :string
    add_column :trips, :sherpa_owner, :string
    add_column :trips, :date_of_travel, :date
  end
end
