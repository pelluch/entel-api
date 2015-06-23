class PlanTypesController < ApplicationController

	def index
		@plan_types = PlanType.all
		render json: @plan_types, status: :ok

	end
end
