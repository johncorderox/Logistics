class ChangeOccupationToCompany < ActiveRecord::Migration
  def change
    rename_column :users, :occupation, :company
  end
end
