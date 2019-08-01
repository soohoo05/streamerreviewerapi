class Review < ApplicationRecord
  belongs_to :user
  belongs_to :streamer
  validates :description, presence: true
  validates :rating, presence: true

  
end
