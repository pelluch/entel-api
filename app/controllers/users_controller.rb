class UsersController < ApplicationController

	def create
		@user = User.new(user_params)
		if @user.save
			render json: @user, status: :ok
		else
			render json: @user, status: :unprocessable_entity
		end
	end

	private
	def user_params
		params.require(:user).permit(:rut, :phone_number, :password, :password_confirmation).tap do |p|
			p[:password] = params.require(:password)
			p[:password_confirmation] = params.require(:password_confirmation)
		end
	end
end
