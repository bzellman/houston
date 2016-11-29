class AddTripToTripitems < ActiveRecord::Migration[5.0]
  def change
    add_reference :tripitems, :trip, foreign_key: true
  end
end
