class DailyTrafficsController < ApplicationController

	def index
		user = User.find(params[:user_id])
		render json: user.daily_traffics, status: :ok
	end
end
