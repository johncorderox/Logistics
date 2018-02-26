class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.string :title
      t.float :price
      t.datetime :delivery_start
      t.datetime :delivery_end
      t.string :status
      t.references :users, index: true, foreign_key: true
      t.references :address, index: true, foreign_key: true
      t.references :auction, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
