class AddIDandPersonalToTikets < ActiveRecord::Migration
  def change
    add_column :tikets, :user_name, :string
    add_column :tikets, :passport, :integer
  end
end
