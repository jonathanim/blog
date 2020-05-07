class Order < ApplicationRecord
  validates :product_name, presence: true
  validates :product_count, presence: true
  validates :product_count, numericality: { only_integer: true }
  validates :customer, presence: true

  belongs_to :customer
end
  
