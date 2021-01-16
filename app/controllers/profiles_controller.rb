class ProfilesController < ApplicationController

  def edit
  end

  def update
    @user = current_user
    skip_authorization
    @user.update(params_user)
    redirect_to dashboard_path
  end

  private

  def params_user
     params.require(:user).permit(:username, :first_name, :last_name, :address, :phone_number, :date_of_birth, :nationality, :gender, :avatar, :photo)
  end

end

