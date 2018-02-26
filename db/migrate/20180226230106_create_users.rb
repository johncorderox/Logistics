class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :occupation
      t.string :phone_number
      t.integer :level
      t.references :address, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
