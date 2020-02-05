class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @shelter_id = params[:id]
  end

  def create
    pet = Pet.create(pet_params)
    redirect_to "/shelters/#{pet.shelter_id}/pets"
  end

  private
    def pet_params
      params.permit(:image, :name, :description, :age, :sex, :status, :shelter_id)
    end

end
