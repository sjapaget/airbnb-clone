class Bicycle < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reservations, dependent: :destroy

  validates :title, :category, :description, :price_per_day, :user, presence: true
  validates :price_per_day, numericality: { only_integer: true, greater_than: 0 }
  validates :size, inclusion: { in: %w[small medium large],
                                message: "Sorry, %<value> is not a size we accept" }
  validates :category, inclusion: { in: %w[road gravel fixie child mountain city other],
                                    message: "Sorry, %<value> is not a category we accept" }
  validates :title, :description, length: { minimum: 1 }

  SIZES = %w[small medium large]
  CATEGORIES = %w[road gravel fixie child mountain city other]
  DEFAULT_IMG = "https://media.istockphoto.com/vectors/image-preview-icon-picture-placeholder-for-website-or-uiux-design-vector-id1222357475?k=20&m=1222357475&s=612x612&w=0&h=jPhUdbj_7nWHUp0dsKRf4DMGaHiC16kg_FSjRRGoZEI="
end
