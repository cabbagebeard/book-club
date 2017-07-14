class ChangeFieldsOnReadings < ActiveRecord::Migration
  def change
    add_column :readings, :book_id, :integer
    remove_column :readings, :isbn
  end
end
