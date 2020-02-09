class ReviewsController < ApplicationController

    def new
      @shelter = Shelter.find(params[:id])
    end

    def create
      # binding.pry
      @shelter = Shelter.find(params[:shelter_id])
      review = Review.new(review_params)
      # redirect_to "/shelters/#{review.shelter.id}"
        if review.save
          redirect_to "/shelters/#{@shelter.id}"
          # redirect_to "/shelters/#{params[:id]}"
        else
          flash[:notice] = "All fields must be completed to submit review."
          render :new
        end
    end

    private

      def review_params
        params.permit(:title,
                    :content,
                    :rating,
                    :shelter_id,
                    :image)
      end
end