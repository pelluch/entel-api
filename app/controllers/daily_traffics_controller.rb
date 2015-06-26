class DailyTrafficsController < ApplicationController

	def index
		user = User.find(params[:user_id])
		render json: user.daily_traffics, status: :ok
	end

	def month
		user = User.find(params[:user_id])
		traffic = user.monthly_traffic
		render json: traffic, status: :ok
	end
end
