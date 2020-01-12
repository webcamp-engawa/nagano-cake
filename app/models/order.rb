class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items

  validates :postcode, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'は「○○○-○○○○」で入力して下さい。' }
  validates :address_name, presence: true
  validates :payment,  presence: true
  enum payment: {クレジットカード:1, 銀行振込:2}
end
