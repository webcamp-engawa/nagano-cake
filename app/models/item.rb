class Item < ApplicationRecord
  has_many :order_items
  has_many :cart_items
  belongs_to :genre
  validates :genre_id, presence: true, numericality: :only_integer
  validates :name, presence: true
  validates :introduction, presence: true
  validates :image_id, presence: true
  validates :price, presence: true, numericality: {only_integer: true}
  validates :is_sold, inclusion: { in: [true, false] }
  attachment :image
end
