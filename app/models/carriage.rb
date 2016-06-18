class Carriage < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :carriage_type
  belongs_to :train
end
