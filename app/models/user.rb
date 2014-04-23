# encoding: UTF-8
#
class User < ActiveRecord::Base
  has_many :orders
  has_many :addresses

  attr_accessor :updating_password

  validates_presence_of :first_name, :last_name, :email_confirmation
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_confirmation_of :email
  validates_confirmation_of :password, if: :updating_password
  validates_presence_of :password_confirmation, if: :updating_password

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :trackable, :validatable

  def should_validate_password?
    updating_password || new_record?
  end

  def to_s
    first_name + ' ' + last_name + ' - ' + id.to_s
  end

  def name
    first_name + ' ' + last_name
  end
end
