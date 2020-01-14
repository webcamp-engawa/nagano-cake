class Admin::HomeController < ApplicationController
	def top
		#@order = Order.where(created_at: 1.day.ago.all_day
			@order = Order.where("created_at >= ?", Time.zone.now.beginning_of_day)

	end
end
