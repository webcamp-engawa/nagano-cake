# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Admin.create(email: "a@a", password:"admins")
Customer.create([
  {last_name:"山田", first_name:"太郎", last_name_kana:"ヤマダ", first_name_kana:"タロウ", postcode:"123-4567", address:"東京都品川区戸越1-1-1", phone_number:"0000000000", email: "b@b.b", password:"123456"},
  {last_name:"田中", first_name:"太郎", last_name_kana:"タナカ", first_name_kana:"タロウ", postcode:"123-4567", address:"東京都渋谷区代々木2−2−2", phone_number:"0122345555", email: "g@g.g", password:"123456"},
  {last_name:"佐藤", first_name:"二郎", last_name_kana:"サトウ", first_name_kana:"ジロウ", postcode:"123-4567", address:"東京都新宿区2−2−2", phone_number:"0122345555", email: "h@h.h", password:"123456"},
  {last_name:"榊", first_name:"二郎", last_name_kana:"サカキ", first_name_kana:"ジロウ", postcode:"123-4567", address:"長野県松本市2−2−2", phone_number:"0122345555", email: "J@J.J", password:"123456"},
  {last_name:"大阪", first_name:"なおみ", last_name_kana:"オオサカ", first_name_kana:"ナオミ", postcode:"123-4567", address:"沖縄県那覇市3-4-2", phone_number:"0122345555", email: "k@k.k", password:"123456"}
  ])
Shipping.create([
  {customer_id:1, postcode:"123-4567", address:"東京都品川区戸越1-1-1",address_name:"山田太郎"},
  {customer_id:1, postcode:"125-3029", address:"東京都渋谷区1-1-1",address_name:"山田花子"}
  ])
Genre.create([
  {name:"ケーキ", is_active:true},
  {name:"プリン", is_active:true},
  {name:"焼き菓子", is_active:true},
  {name:"キャンディ", is_active:true}
  ])
Item.create([
    {genre_id:3, name:"シュークリーム", introduction:"甘さ控えめのシュークリームです。", image_id: "033179931df84b865ca01494abcdf564adc09f0ffb1c5ecf0b6769d44168", price:400, is_sold: true, boolean: false},
    {genre_id:1, name:"ガトーショコラ", introduction:"甘さ控えめのガトーショコラです。", image_id: "27ad72b698b8908522e50c1c42761b229c4e2e34b359d8e4a88cae29c1ad", price:800, is_sold: true, boolean: false},
    {genre_id:1, name:"抹茶ケーキ", introduction:"甘さ控えめの抹茶ケーキです。", image_id: "a3ff3f6556aed005cda28637de10608735b9596fda8e34de43db0aa44eff", price:700, is_sold: true, boolean: false},
    {genre_id:3, name:"シナモンロール", introduction:"甘さ控えめのシナモンロールです。", image_id: "7328fd7c5a6dd252a2f08cfeb0d9fbb2fa4b1b765ee77dfa716db701c4ca", price:500, is_sold: true, boolean: false},
    {genre_id:3, name:"アップルパイ", introduction:"甘さ控えめのアップルパイです。", image_id: "1269d5e9f3060741dd17ca1f6543c8a618ceaf0d042de0c3c5afe0a1ca1f", price:1000, is_sold: true, boolean: false},
    {genre_id:3, name:"シナモンラズベリーロール", introduction:"甘さ控えめのシナモンラズベリーロールです。", image_id: "11883c7c2020e1fb6cfb150d30c2fa3b385b50618455f659371345448e63", price:500, is_sold: true, boolean: false},
    {genre_id:3, name:"ジンジャークッキー", introduction:"甘さ控えめのジンジャークッキーです。", image_id: "79e9a1b9b8c91a0fe731a58d1301ffae0645869e0fa4a0e37bda4d19ccda", price:300, is_sold: true, boolean: false},
    {genre_id:1, name:"ショコラミルフィーユ", introduction:"甘さ控えめのショコラミルフィーユです。", image_id: "10a653315f9cfb770160b40c95725dec286212fa5a3af4cb63531da8be59", price:900, is_sold: true, boolean: false},
    {genre_id:1, name:"チョコクリームケーキ", introduction:"甘さ控えめのチョコクリームケーキです。", image_id: "3802a2e905d3153e70aa31d56ce197c29e0ab5cff18a6e5484f8414c571e", price:2500, is_sold: true, boolean: false},
    {genre_id:1, name:"ミルフィーユタルト", introduction:"甘さ控えめのミルフィーユタルトです。", image_id: "e0f0e760c5802ca6b34b5092cd658f67a27895bcdf69810985c97f551e99", price:1800, is_sold: true, boolean: false},
    {genre_id:3, name:"チョコチップクッキー", introduction:"甘さ控えめのチョコチップクッキーです。", image_id: "a9f9caa382524974d96c9920ca93cfba59f8674d067243ca094ebfa246b7", price:300, is_sold: true, boolean: false},
    {genre_id:3, name:"シンプルなドーナツ", introduction:"甘さ控えめのシンプルなドーナツです。", image_id: "56f28aece92391da698c6c806f5fe9ce50b2d46fb335a0d9d01d2bc20421", price:400, is_sold: true, boolean: false},
    {genre_id:1, name:"ラズベリーケーキ", introduction:"甘さ控えめのラズベリーケーキです。", image_id: "1a727652867594f19f19d0e6ed533620114a0dbe69d6c1456fcdf88d8bee", price:2800, is_sold: true, boolean: false},
    {genre_id:3, name:"ブラックシナモンロール", introduction:"甘さ控えめのブラックシナモンロールです。", image_id: "d89a73a21ffdd5f9ca92f0fc7c7de765d6ce37f83662628120a172e28f49", price:600, is_sold: true, boolean: false},
    {genre_id:4, name:"ペロキャン", introduction:"甘さ控えめのペロキャンです。", image_id: "17c1fa68801e009952cd77bf0b0f00884cbf388d5e4fc2ab45274f55b264", price:300, is_sold: true, boolean: false},
    {genre_id:2, name:"豆乳プリン", introduction:"甘さ控えめの豆乳プリンです。", image_id: "40ced1d4e17e5d7e2d0d5fd0dbe0d191d5de97bb9f96ce1f60195f850710", price:400, is_sold: true, boolean: false}

  ])
# CartItem.create(customer_id:1, item_id:1, quantity:1)
Order.create([
  {customer_id:1, postcode:"123-4567", address:"東京都品川区戸越1-1-1",  address_name:"山田 太郎", postage:800, total_price:1880, payment:1, order_status:1},
  {customer_id:2, postcode:"123-4567", address:"東京都渋谷区代々木2−2−2",  address_name:"田中 太郎", postage:800, total_price:1340, payment:2, order_status:1}
  ])
OrderItem.create([
  {order_id:1, item_id:4, quantity:1, order_price:500, cooking_status:3},
  {order_id:1, item_id:6, quantity:1, order_price:500, cooking_status:2},
  {order_id:2, item_id:4, quantity:1, order_price:500, cooking_status:2}
  ])