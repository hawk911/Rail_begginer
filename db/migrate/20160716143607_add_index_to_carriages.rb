class AddIndexToCarriages < ActiveRecord::Migration
  def change
    add_index :carriages, [:id, :type]
    add_index :carriages, :carriage_type_id
    add_index :carriages, :train_id
  end
end
