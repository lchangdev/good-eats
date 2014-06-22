class Review < ActiveRecord::Base
  validates :rating, length: { in: 1..5}, presence: true
  validates :body, presence: true
  validates :restaurant_id, presence: true

  belongs_to :restaurant
end
