class User < ActiveRecord::Base
  has_many :tikets
  CURRENT_USER = User.find_by(name: 'Admin') || User.create(name: 'Admin')

  validates :name, presence: true

  def self.current_user
    CURRENT_USER
  end

end
