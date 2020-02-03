class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
  end

  def create
    shelter = Shelter.find(params[:id])
    shelter.pets.create({
      name: params[:name],
      age: params[:age],
      sex: params[:sex],
      status: params[:status],
      description: params[:description]
      })

    pet.save

    redirect_to "/shelters/#{pet.shelter_id}/pets"
  end


end
