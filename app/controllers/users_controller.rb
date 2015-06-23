class UsersController < ApplicationController

	def create
		@user = User.new(user_params)
		render json: @user
	end

	private
	def user_params
		params.require(:user).permit(:rut, :phone, :password, :password_confirmation).tap do |p|
			p[:password] = params.require(:password)
			p[:password_confirmation] = params.require(:password_confirmation)
		end
	end
end
