class AddIndexToTikets < ActiveRecord::Migration
  def change
    add_index :tikets, :begin_station_id
    add_index :tikets, :end_station_id
    add_index :tikets, :train_id
    add_index :tikets, :user_id
  end
end
