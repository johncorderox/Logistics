class AddStatusColumnToAuctions < ActiveRecord::Migration
  def change
    add_column :auctions, :status, :string
  end
end
