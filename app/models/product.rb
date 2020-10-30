class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shopping_cost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shopping_day

  belongs_to :user
  has_one_attached :image

  validates :image, :name, :description, :price, presence: true
  validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/, message: 'Price is not included in the list' }

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shopping_cost_id
    validates :prefecture_id
    validates :shopping_day_id
  end
end
