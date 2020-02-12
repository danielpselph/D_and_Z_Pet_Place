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
    if session[:favorites] == nil || session[:favorites].empty?
      @pets = nil
    else
      @pets = Pet.find(session[:favorites])
    end
  end

  def destroy_all
    # require "pry"; binding.pry
    session[:favorites] = favorites.contents
    favorites.contents.clear
    flash[:notice] = "Your Favorites list has been cleared."
    redirect_back(fallback_location: "/pets")
  end
end
