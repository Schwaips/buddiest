class BookingsController < ApplicationController

  def show
    @booking = Booking.all
    authorize @booking
  end

  def new
    @booking = Booking.new
    @offer = Offer.find(params[:offer_id])
    authorize @booking
  end

  def create
    @booking = Booking.new(params_booking)
    @offer = Offer.find(params[:offer_id])
    @booking.offer = @offer
    @booking.user = current_user
    @booking.status = "En attente de validation de l'utilisateur"
    authorize @booking
    if @booking.save
      redirect_to offer_path(@offer)
    else
      render :new
    end
  end

  private

  def params_booking
     params.require(:booking).permit(:date_begin, :date_end, :offer, :status, :description, :photos)
  end

end
