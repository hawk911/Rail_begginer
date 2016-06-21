class Carriage < ActiveRecord::Base

  belongs_to :carriage_type
  belongs_to :train

  validates :name, presence: true
  validates :number, uniqueness: { scope: :train_id }
end
