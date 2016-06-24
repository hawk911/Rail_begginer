class Train < ActiveRecord::Base

  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route

  has_many :tikets
  has_many :carriages

  def carriage_compartments
    carriages.select do |carriage|
      carriage.carriage_type == CarriageType.find(2)
    end
  end

  def compartment_down_seats
    carriage_compartments.map { |carriage| carriage.count_down}.reduce(0, :+)
  end

  def compartment_up_seats
    carriage_compartments.map { |carriage| carriage.count_up}.reduce(0, :+)
  end

  def count_carriage_compartment
    self.carriage_compartments.size
  end

  def carriage_reserveds
    carriages.select do |carriage|
       carriage.carriage_type == CarriageType.find(1)
    end
  end

  def reserved_down_seats
    carriage_reserveds.map { |carriage| carriage.count_down}.reduce(0, :+)
  end

  def reserved_up_seats
    carriage_reserveds.map { |carriage| carriage.count_up}.reduce(0, :+)
  end

  def count_carriage_reserved
    self.carriage_reserveds.size
  end

  protected

  validates :number, presence: true
end





