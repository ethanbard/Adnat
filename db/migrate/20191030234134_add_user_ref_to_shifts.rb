class AddUserRefToShifts < ActiveRecord::Migration[5.2]
  def change
    remove_column :shifts, :user_id, :integer
    add_reference :shifts, :users, foreign_key: true
  end
end
