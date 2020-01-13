class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items

  validates :payment,  presence: true
  enum payment: { クレジットカード: 1, 銀行振込: 2 }
  validates :postcode, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'は「○○○-○○○○」で入力して下さい。' }
  validates :address, presence: true
  validates :address_name, presence: true

  validates_acceptance_of :confirming
  after_validation :check_confirming

  def check_confirming
    errors.delete(:confirming)
    self.confirming = errors.empty? ? '1' : ''
  end
end
