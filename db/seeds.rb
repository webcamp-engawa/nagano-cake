# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Admin.create(email: "a@a", password:"admins")
Customer.create(last_name:"山田", first_name:"太郎", last_name_kana:"ヤマダ", first_name_kana:"タロウ", postcode:"123-4567", address:"東京都品川区戸越1-1-1", phone_number:"0000000000", email: "b@b.b", password:"123456")
Shipping.create(customer_id:1, postcode:"123-4567", address:"東京都品川区戸越1-1-1",address_name:"山田太郎")
Genre.create(name:"ケーキ", is_active:true)
Item.create(genre_id:1, name:"ショートケーキ", introduction:"甘さ控えめのシンプルなショートケーキです。", price:36000)
CartItem.create(customer_id:1, item_id:1, quantity:1)
Order.create(customer_id:1, postcode:"123-4567", address:"東京都品川区戸越1-1-1",  address_name:"阿部 亮太郎", postage:800, total_price:1200, payment:1, order_status:1)
OrderItem.create(order_id:1, item_id:1, quantity:1, order_price:36000, cooking_status:2)