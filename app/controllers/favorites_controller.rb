class FavoritesController < ApplicationController
  include ActionView::Helpers::TextHelper

  def update
    # require "pry"; binding.pry
    if params[:remove]
      pet = Pet.find(params[:pet_id])
      session[:favorites] = favorites.contents
      favorites.contents.delete(pet.id)
      flash[:notice] = "#{pet.name} has been removed from your Favorites."
      redirect_back(fallback_location: "/pets")
    else
      pet = Pet.find(params[:pet_id])
      favorites.add_pet(pet.id)
      session[:favorites] = favorites.contents
      flash[:notice] = "#{pet.name} is now in your Favorites."
      redirect_to "/pets/#{pet.id}"
    end
  end

  def index
    # require "pry"; binding.pry
    if session[:favorites] == nil || session[:favorites].empty?
      @pets = nil
    else
      # require "pry"; binding.pry
      @pets = Pet.find(session[:favorites])
    end
  end
end
