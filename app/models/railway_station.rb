class RailwayStation < ActiveRecord::Base

  #has_many :tikets
  #:current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  has_many :trains, foreign_key: :current_station_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  scope :ordered, -> { joins(:railway_stations_routes).select('railway_stations_routes.*, railway_stations.title, railway_stations.id').order('railway_stations_routes.position').uniq }


  validates :title, presence: true
  validates :number, presence: true

  def update_position(route, position)
    station_route = station_route(route)
    station_route.update(position: position) if station_route
  end

  def position_in(route)
    station_route(route).try(:position)
  end

  def update_departure_time(route, departure_time)
    station_route = station_route(route)
    station_route.update(departure_time: departure_time) if station_route
  end

  def update_arrival_time(route, arrival_time)
    station_route = station_route(route)
    station_route.update(arrival_time: arrival_time) if station_route
  end

  def arrival_time_in(route)
    station_route(route).try(:arrival_time)
  end

  def departure_time_in(route)
    station_route(route).try(:departure_time)
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end
