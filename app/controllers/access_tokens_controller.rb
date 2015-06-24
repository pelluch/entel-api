class AccessTokensController < ApplicationController

  def create
    rut = params.require(:rut).downcase
    phone_number = params.require(:phone_number).downcase
    password = params.require(:password)
    @user = User.find_by_rut_and_phone_number(rut, phone_number)
    if @user.present? and @user.valid_password? password
      @user.create_token
      render json: @user, status: :ok
    else
      render nothing: true, status: :unauthorized
    end
  end

end
