class Tiket < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :begin_station, class_name: 'RailwayStation', foreign_key: :begin_station_id
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_station_id
  belongs_to :train
  belongs_to :user

end
