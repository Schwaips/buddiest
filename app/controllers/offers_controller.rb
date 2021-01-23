class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @offers = Offer.all

    # geocode
    @markers = @offers.geocoded.map do |offer|
      {
        lat: offer.latitude,
        lng: offer.longitude
      }
    end
    # moteur de recherche
    if params[:query].present?
      @offers = Offer.where('title ILIKE ?', "%#{params[:query]}%")
    else
      @offers = Offer.all
    end
  end

  def new
    @offer = Offer.new
    authorize @offer
  end

  def create
    @offer = Offer.new(params_offer)
    @offer.user = current_user
    authorize @offer
    if @offer.save
      flash[:notice] = "L'offre #{@offer.title} est maintenant publiée, merci"
      redirect_to offers_path(@offer)
    else
      render :new
    end
  end

  def show
    @offer = Offer.find(params[:id])
    @booking = Booking.new

    @markers = {
        lat: @offer.latitude,
        lng: @offer.longitude
      }
    authorize @offer

  end


  def edit
    @offer = Offer.find(params[:id])
    authorize @offer
  end

  def update
    @offer = Offer.find(params[:id])
    authorize @offer
    @offer.update(params_offer)
    redirect_to dashboard_path
    flash[:notice] = "L'offre #{@offer.title} est à jour, merci"
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy
    if authorize @offer
      flash[:notice] = "L'offre #{@offer.title} bien supprimée, merci"
      redirect_to offers_path
    else
      render :show
    end
  end

  private

  def params_offer
    params.require(:offer).permit(:address, :area, :price_per_hour, :title, :description, :photo )
  end

end
