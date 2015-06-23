class PlansController < ApplicationController


	def show
		user = User.find(params[:user_id])
		render json: user.plan, status: :ok
	end

	def index
		plan_type = PlanType.find(params[:plan_type_id])
		render json: plan_type.plans, status: :ok
	end
end
