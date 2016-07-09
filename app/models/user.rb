class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :trackable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :tikets

  CURRENT_USER = User.find_by(name: 'Admin') || User.create(name: 'Admin')

  #validates :name, presence: true

  def self.current_user
    CURRENT_USER
  end

end
