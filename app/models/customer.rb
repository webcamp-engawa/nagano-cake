class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 def active_for_authentication?
    super && self.is_deleted == false
  end
  has_many :shippings
  has_many :orders
  has_many :cart_items


  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。' }
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。' }
  validates :postcode, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'は「○○○-○○○○」で入力して下さい。' }
  validates :address, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: 'は10桁か11桁で入力して下さい。' }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX, message: 'は「○@○.○」という形式で入力して下さい。'  }

  composed_of :fullname,
    :class_name => "FullName",
    :mapping => [
      [:last_name, :last_name],
      [:first_name, :first_name]
    ]
end

class FullName
  attr_reader :last_name, :first_name

  def initialize(last_name, first_name)
    @last_name = last_name
    @first_name = first_name
  end

  def to_s
    [@last_name, @first_name].compact.join("")
  end

 
end
