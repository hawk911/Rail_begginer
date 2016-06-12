class CreateTikets < ActiveRecord::Migration
  def change
    create_table :tikets do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
