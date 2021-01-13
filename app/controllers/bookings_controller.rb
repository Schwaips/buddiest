class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(params_booking)
    @booking.user = current_user
    # @booking.status = "En attente de validation de #{@booking.offer.user.first_name}"
    authorize @booking
    if @booking.save
      redirect_to bookings_path(@booking)
    else
      render :new
    end
  end

  private

  def params_booking
     params.require(:booking).permit(:date_begin, :date_end, :offer, :status, :description, :photos)
  end

end
