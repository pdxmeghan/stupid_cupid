class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :password, presence: true
  validates_uniqueness_of :name
  validates_length_of :name, :maximum => 10
end
