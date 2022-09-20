class Bicycle < ApplicationRecord
  belongs_to :user

  validates :title, :category, :description, :price, :user, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 0 }
  validates :size, inclusion: { in: %w[small medium large], message: "Sorry, %{value} is not a size we accept" }
  validates :category, inclusion: { in: %w[road gravel fixie child mountain city other], message: "Sorry, %{value} is not a size we accept" }
  validates :title, :description, length: { minimum: 1 }
end
