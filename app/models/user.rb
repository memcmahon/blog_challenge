class User < ApplicationRecord
  validates_presence_of :email, :password, :first_name, :last_name
  validates_uniqueness_of :email

  has_secure_password

  has_many :posts
end
