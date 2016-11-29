class CreateTripitems < ActiveRecord::Migration[5.0]
  def change
    create_table :tripitems do |t|

      t.timestamps
    end
  end
end
