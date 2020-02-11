class AdoptionsController < ApplicationController
  include ActionView::Helpers::FormTagHelper

    def new
      @pets = Pet.find(session[:favorites])
    end

    def create
      adoption = Adoption.new(adoption_params)
        if adoption.save
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
