class AddFieldsToDiscussionsAndComments < ActiveRecord::Migration
  def change
    add_column :discussions, :user_id, :integer
    add_column :comments, :user_id, :integer
    add_column :comments, :discussion_id, :integer
  end
end
