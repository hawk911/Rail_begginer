class Carriage < ActiveRecord::Base

  belongs_to :carriage_type
  belongs_to :train

  validates :name, presence: true
end
