class PagesController < ApplicationController
  def home
    flash[:notice] = "Yo"
  end

  def history
    @user = current_user
    @bookings = @user.bookings
  end

end

