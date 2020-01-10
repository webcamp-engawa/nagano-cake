class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  validates :quantity, presence: { message: '個数を洗濯して下さい' }
end
