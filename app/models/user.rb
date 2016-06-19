class User < ActiveRecord::Base
  has_many :tikets

  validates :name, presence: true
end
