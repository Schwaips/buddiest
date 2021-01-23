class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:dashboard, :home]

  def home
  end

  def dashboard
    # offre que l'utilisteur a créé
    @user = current_user
    @offers = @user.offers

    # access for booking data
    @bookings = []
    @offers.each do |offer|
      @bookings << offer.bookings unless offer.bookings.empty?
    end
    @bookings.flatten!

    @pendingBookings = @bookings.select do |booking|
      booking.status == "En attente"
    end

    @statuedBookings = @bookings.select do |booking|
      booking.status != "En attente"
    end
  end

    # access to update booking to the api in js
    # if @bookings.find(params[:id]).save
    #   render json: { success: true }
    # else
    #   render json: { success: false, errors: bookings.errors.messages }, status: :unprocessable_entity
    # end

  private

  def params_booking
     params.require(:booking).permit(:date_begin, :date_end, :offer, :status, :description)
  end
end
