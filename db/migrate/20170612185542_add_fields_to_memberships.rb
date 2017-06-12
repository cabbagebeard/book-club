class AddFieldsToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :user_id, :integer
    add_column :memberships, :club_id, :integer
    add_column :memberships, :admin, :boolean, default: false
  end
end
