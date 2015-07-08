class PlansController < ApplicationController

	before_action :doorkeeper_authorize!, only: :show

	def show		
		render json: current_user.plan, status: :ok
	end

	def index
		plan_type = PlanType.find(params[:plan_type_id])
		render json: plan_type.plans, status: :ok
	end
end
