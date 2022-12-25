class ReviewsController < ApplicationController
    def index
        render json: Review.all, status: :ok
    end
    def create
        review = Review.create!(review_params)
        render json: review, status: :created
    end

    def update
        review = Review.find(params[:id])
        review.update(review_params)
        render json: review, status: :ok
    end
    def destroy
        review = Review.find(params[:id])
        review.destroy
        head :no_content
    end

    private
    def review_params
        params.permit(:counselor_profile_id, :user_id, :comment, :approved)
    end
end
