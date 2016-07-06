class Search < ActiveRecord::Base
  def self.get_trains(from_station, to_station)
    if from_station != to_station
        routes = Route.joins(:railway_stations).where(railway_stations: { id: from_station } ) &
        Route.joins(:railway_stations).where(railway_stations: {id: to_station})
        Train.joins(:route).where(route: routes)
    end
  end
end
