class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:dashboard]


  def dashboard
    # offre que l'utilisteur a créé
    @user = current_user
    @offers = @user.offers

    @bookings = []
    @offers.each do |offer|
      @bookings << offer.bookings
    end
    @bookings.flatten
  end

end

