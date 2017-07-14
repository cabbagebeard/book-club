class AddFieldsToReadings < ActiveRecord::Migration
  def change
    add_column :readings, :club_id, :integer
    add_column :readings, :isbn, :string
    add_column :readings, :current, :boolean, default: false
  end
end
