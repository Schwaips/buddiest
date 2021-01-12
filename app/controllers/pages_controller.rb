class PagesController < ApplicationController
  def home
    flash[:notice] = "Yo"
  end
end

