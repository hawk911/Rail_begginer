class CreateCarriages < ActiveRecord::Migration
  def change
    create_table :carriages do |t|
      t.string :name
      t.integer :count_up
      t.integer :count_down
      t.string  :type

      t.timestamps null: false
    end
  end
end
