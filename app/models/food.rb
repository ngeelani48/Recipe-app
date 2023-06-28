class Food < ApplicationRecord
  belongs_to :user
  has_many :recipes, through: :recipe_foods

  validates :name, presence: true, length: { maximum: 100 }
  validates :measurement_unit, presence: true, length: { maximum: 100 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
