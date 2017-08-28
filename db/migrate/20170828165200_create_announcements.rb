class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|

      t.timestamps null: false
    end
  end
end
