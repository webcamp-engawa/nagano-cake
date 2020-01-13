class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  enum cooking_status: {着手不可:1, 製作待ち:2, 制作中:3, 製作完了:4}
end
