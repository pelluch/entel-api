class DailyTrafficsController < ApplicationController

	before_action :doorkeeper_authorize!, only: :month

	def index
		render json: current_user.daily_traffics, status: :ok
	end

	def month
		traffic = current_user.monthly_traffic
		render json: traffic, status: :ok
	end
end
