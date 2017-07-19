class AddFieldsToCommentsAndDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :title, :string
    add_column :discussions, :body, :text
    add_column :comments, :body, :text
  end
end
