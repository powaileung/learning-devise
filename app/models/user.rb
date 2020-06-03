class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  attr_accessor :signin
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:signin)
    where(conditions).where(["lower(username) = :value OR lower(email) = 
    :value", {:value => login.strip.downcase }]).first
end 
  validates :username, :uniqueness => {:case_sensitive => false}
         
end
