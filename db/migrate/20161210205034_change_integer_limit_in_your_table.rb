class ChangeIntegerLimitInYourTable < ActiveRecord::Migration[5.0]
  def change
    change_column :trips, :id, :integer, limit: 4
  end
end
