class AddFieldsToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :user_id, :integer
    add_column :announcements, :club_id, :integer
    add_column :announcements, :subject, :string
    add_column :announcements, :body, :text
  end
end
