class ReviewsController < ApplicationController

    def new
      @shelter = Shelter.find(params[:id])
    end

    def create
      # binding.pry
        review = Review.create(review_params)
        redirect_to "/shelters/#{review.shelter.id}"
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