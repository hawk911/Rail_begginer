class RailwayStation < ActiveRecord::Base

  #has_many :tikets
  #:current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  has_many :trains, foreign_key: :current_station_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true
  validates :number
end
