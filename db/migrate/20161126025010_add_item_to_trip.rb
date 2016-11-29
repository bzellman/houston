class AddItemToTrip < ActiveRecord::Migration[5.0]
  def change
    add_reference :trips, :tripitem, foreign_key: true
  end
end
