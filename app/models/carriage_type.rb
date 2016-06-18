class CarriageType < ActiveRecord::Base
  validates :name, presence: true

  has_many :carriage
end
