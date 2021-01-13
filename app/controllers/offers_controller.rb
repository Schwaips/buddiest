class OffersController < ApplicationController

  def index
    @offers = Offer.all
  end


  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(params_offer)
    @offer.user = current_user
    @offer.save
    redirect_to offers_path(@offer)
  end

  def show
    @offer = Offer.find(params[:id])

  end


  # def edit
  #   @offer = Offer.find(params[:id])
  # end

  # def update
  #   @offer = Offer.find(params[:id])
  #   @offer.update(params_offers)
  #   redirect_to offers_path(@offer)
  # end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy
    redirect_to offers_path
  end

  private

  def params_offer
    params.require(:offer).permit(:address, :area, :price_per_hour, :title, :description, :photos)
  end

end
