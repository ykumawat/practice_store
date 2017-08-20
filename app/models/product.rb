class Product < ApplicationRecord
  has_many :product_categories
  has_many :products, through: :product_categories
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
end
