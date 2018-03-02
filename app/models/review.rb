class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product  

  validates :user_id, presence: true
  validates :product_id, presence: true
  validates_inclusion_of :rating, in: 1..5
end
