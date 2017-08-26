class AddAnnouncementsToClubs < ActiveRecord::Migration
  def change
    add_column :clubs, :announcement, :text
  end
end
