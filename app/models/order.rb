class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items
  accepts_nested_attributes_for :order_items

  validates :payment,  presence: true
  enum payment: { クレジットカード: 1, 銀行振込: 2 }
  validates :postcode, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'は「○○○-○○○○」で入力して下さい。' }
  validates :address, presence: true
  validates :address_name, presence: true

  enum order_status: {入金待ち:1, 入金確認:2, 製作中:3, 発送準備中:4, 発送済み:5}

  validates_acceptance_of :confirming
  after_validation :check_confirming

  def check_confirming
    errors.delete(:confirming)
    self.confirming = errors.empty? ? '1' : ''
  end

end
