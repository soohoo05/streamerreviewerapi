class User < ApplicationRecord
  has_secure_password
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
 validates :username, presence: true, uniqueness: true
 validates :password_digest, presence: true
 validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true
end
