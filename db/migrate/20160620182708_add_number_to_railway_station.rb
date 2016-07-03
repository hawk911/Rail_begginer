class AddNumberToRailwayStation < ActiveRecord::Migration
  def change
    add_column :railway_stations, :number, :integer
  end
end
