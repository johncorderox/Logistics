class RemoveLatAndLongFromAddress < ActiveRecord::Migration
  def change
    remove_column :addresses, :latitude, :float
    remove_column :addresses, :longitude, :float
  end
end
