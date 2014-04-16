class User < ActiveRecord::Base
  has_many :orders
	has_many :addresses

  attr_accessor :updating_password
  
	validates :first_name                 , presence:     true
  validates :last_name                  , presence:     true
  validates :email                      , confirmation: true
  validates :email_confirmation         , presence:     true
  validates :password                   , confirmation: true, :if => :updating_password
  validates :password_confirmation      , presence:     true, :if => :updating_password


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  

  def should_validate_password?
    updating_password || new_record?
  end

  def to_s
    first_name + " " + last_name + " - " + id.to_s
  end

  def name
    first_name + " " + last_name
  end
end
