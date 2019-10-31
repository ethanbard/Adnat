class AddOrgRefToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :organization_id, :integer
    add_reference :users, :organizations, foreign_key: true
  end
end
