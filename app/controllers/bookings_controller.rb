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
    @booking.status = "En attente"

    authorize @booking
      if @booking.save
        redirect_to offer_path(@offer)
      else
        render :new
      end
  end

  def validate
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.update(status: "Validé")
    # pour acces aux partials .js.erb
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


  def refused
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.update(status: "Refusé")


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

  private

  def params_booking
     params.require(:booking).permit(:date_begin, :date_end, :offer, :status, :description, :photos)
  end

end
