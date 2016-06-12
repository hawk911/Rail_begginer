class AddRailwayStationIdToTikets < ActiveRecord::Migration
  def change
    add_belongs_to :tikets, :begin_station
    add_belongs_to :tikets, :end_station
    add_belongs_to :tikets, :train
    add_belongs_to :tikets, :user
  end
end
