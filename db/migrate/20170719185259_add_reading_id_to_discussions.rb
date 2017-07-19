class AddReadingIdToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :reading_id, :integer
  end
end
