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

    def edit 
      # binding.pry
      @shelter = Shelter.find(params[:shelter_id])
      @review = Review.find(params[:review_id])
    end

    def update 
      @shelter = Shelter.find(params[:shelter_id])
      @review = Review.find(params[:review_id])
      @review.update(review_params)
        if @review.save
          redirect_to "/shelters/#{@shelter.id}"
        else 
          flash[:notice] = "All fields must be completed to submit review."
          render :edit
        end
    end

    def destroy
      @shelter = Shelter.find(params[:shelter_id])
      @review = Review.find(params[:review_id])
      Review.destroy(params[:review_id])
      redirect_to "/shelters/#{@shelter.id}"
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