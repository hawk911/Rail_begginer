class CreateCarriageTypes < ActiveRecord::Migration
  def change
    create_table :carriage_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
