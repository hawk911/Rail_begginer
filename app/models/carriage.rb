class Carriage < ActiveRecord::Base

  belongs_to :carriage_type
  belongs_to :train

  validates :name, :carriage_type, presence: true
  validates :number, uniqueness: { scope: :train_id }

end
