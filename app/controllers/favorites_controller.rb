class FavoritesController < ApplicationController
  include ActionView::Helpers::TextHelper

  def update
    pet = Pet.find(params[:pet_id])
    favorites.add_pet(pet.id)
    session[:favorites] = favorites.contents
    quantity = favorites.count_of(pet.id)
    flash[:notice] = "#{pet.name} is now in your Favorites."
    redirect_to "/pets/#{pet.id}"
  end

end
