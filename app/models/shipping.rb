class Shipping < ApplicationRecord
  belongs_to :customer

  validates :postcode, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'は「○○○-○○○○」で入力して下さい。' }
  validates :address, presence: true
  validates :address_name, presence: true

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
