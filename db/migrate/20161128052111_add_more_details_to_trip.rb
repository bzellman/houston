class AddMoreDetailsToTrip < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :client_email, :string
    add_column :trips, :client_phone, :string
  end
end
