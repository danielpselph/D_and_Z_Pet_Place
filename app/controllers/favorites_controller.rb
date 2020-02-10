class FavoritesController < ApplicationController
  include ActionView::Helpers::TextHelper

  def update
    pet = Pet.find(params[:pet_id])
    favorites.add_pet(pet.id)
    session[:favorites] = favorites.contents
    flash[:notice] = "#{pet.name} is now in your Favorites."
    redirect_to "/pets/#{pet.id}"
  end

  def index
    # require "pry"; binding.pry
    if session[:favorites] == nil || session[:favorites].empty?
      @pets = nil
    else
      @pets = Pet.find(session[:favorites])
    end
  end

end
