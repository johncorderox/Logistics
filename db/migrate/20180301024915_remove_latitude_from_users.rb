class RemoveLatitudeFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :latitide, :float
  end
end
