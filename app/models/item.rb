class Item < ApplicationRecord
  has_many :order_items
  has_many :cart_items
  belongs_to :genre
  validates :genre, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  # validates :image, presence: true
  validates :price, presence: true, numericality: {only_integer: true}
  validates :is_sold, inclusion: { in: [true, false] }
  attachment :image

  def self.active_all
    genre_ids = Genre.where(is_active: true).pluck(:id)
    Item.where(genre_id: genre_ids, is_sold: true)
  end
  #attr_accessor :genre
  scope :by_name_like, lambda { |name|
    where('name LIKE :value', { value: "#{sanitize_sql_like(name)}%"})
  }
end
