class Tiket < ActiveRecord::Base

  belongs_to :begin_station, class_name: 'RailwayStation', foreign_key: :begin_station_id
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_station_id
  belongs_to :train
  belongs_to :user

  after_create :send_notification
  after_destroy :delete_notifacation

  validates :name, presence: true

  def route_name
    "#{begin_station.title} - #{end_station.title}"
  end

  def send_notification
    TiketsMailer.buy_tiket(self.user, self).deliver_now
  end

  def delete_notifacation
    TiketsMailer.delete_tiket(self.user, self).deliver_now
  end

end
