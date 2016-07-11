class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :trackable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :tikets

  validates :name, presence: true

end
