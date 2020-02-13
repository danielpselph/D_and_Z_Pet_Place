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
    pet = Pet.new(pet_params)
      if pet.save
        redirect_to "/shelters/#{pet.shelter_id}/pets"
      else 
        flash[:notice] = pet.errors.full_messages.to_sentence
        render :new
      end
  end

  def destroy
    Pet.destroy(params[:id])
    redirect_to '/pets'
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    pet.update(pet_params)
      if pet.save
        redirect_to "/pets/#{pet.id}"
      else
        flash[:notice] = pet.errors.full_messages.to_sentence
        redirect_to "/pets/#{pet.id}/edit"
      end
  end

  private
    def pet_params
      params.permit(:image, :name, :description, :age, :sex, :status, :shelter_id)
    end

end
