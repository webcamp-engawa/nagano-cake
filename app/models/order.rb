class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items
  accepts_nested_attributes_for :order_items

  validates :payment,  presence: { message: 'が入力されていません。'}
  enum payment: { クレジットカード: 1, 銀行振込: 2 }
  validates :postcode, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'は「○○○-○○○○」で入力して下さい。' }
  validates :address, presence: { message: 'が入力されていません。'}
  validates :address_name, presence: { message: 'が入力されていません。'}

  enum order_status: {入金待ち:1, 入金確認:2, 製作中:3, 発送準備中:4, 発送済み:5}
  attr_accessor :shipping
  validates_acceptance_of :confirming
  after_validation :check_confirming

  def check_confirming
    errors.delete(:confirming)
    self.confirming = errors.empty? ? '1' : ''
  end

  def order_sum
    total =  0
    order_items.each do |it|
      total += it.order_price * it.quantity
    end
    total
  end

  composed_of :fulladdress,
    :class_name => "FullAddress",
    :mapping => [
      [:postcode, :postcode],
      [:address, :address],
      [:address_name, :address_name]
    ]
end

class FullAddress
  attr_reader :postcode, :address, :address_name

  def initialize(postcode, address, address_name)
    @postcode = postcode
    @address = address
    @address_name = address_name
  end

  def to_s
    [@postcode, @address, @address_name].compact.join("")
  end
end