class AdoptionsController < ApplicationController
  include ActionView::Helpers::FormTagHelper

    def new
      @pets = Pet.find(session[:favorites])
      # require "pry"; binding.pry
    end

    def create
      @pets = Pet.find(session[:favorites])
      # params[:pet][:pet_id].delete_if {|id| id.blank?}
      adoption = Adoption.create(adoption_params)
      # require "pry"; binding.pry
        if params[:adopt_pets].nil?
          flash[:notice] = "must select pets."
          render :new
        elsif adoption.save
          # require "pry"; binding.pry
          pet_ids = params[:adopt_pets]
          adopt_pets = Pet.find(params[:adopt_pets])
          adoption.pets << adopt_pets
          favorites.delete_favorites(pet_ids)
          # require "pry"; binding.pry
          redirect_to "/favorites"
          flash[:notice] = "Application Created!"
        else
          flash[:notice] = "All fields must be completed to submit adoption application."
          render :new
        end
    end

    private
      def adoption_params
        params.permit(:name,
                      :address,
                      :city,
                      :state,
                      :zip,
                      :phone,
                      :qualifications)
      end

end
