class Streamer < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :photos
  validates :username, presence: true, uniqueness: true
  validates :url, presence: true
  validates :category, presence: true
end
