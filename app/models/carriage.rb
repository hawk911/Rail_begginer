class Carriage < ActiveRecord::Base

  TYPES = %w(ComfortCarriage EconomyCarriage SitCarriage SvCarriage)

  belongs_to :carriage_type
  belongs_to :train

  before_validation :set_number

  validates :type, presence: true, inclusion: { in: TYPES }
  validates :number, uniqueness: { scope: :train_id }

  scope :ordered, -> (from_head) { order(from_head ? 'number' : 'number DESC') }

  private

  def set_number
    number_max = train.carriages.maximum(:number)
    self.number = number_max.nil? ? 1 : number_max +1
  end
end
