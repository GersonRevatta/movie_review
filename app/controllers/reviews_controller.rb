class ReviewsController < ApplicationController
  before_action :find_review, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :set_movie
  def new
    @review = current_user.reviews.new
  end

  def create
    @review = current_user.reviews.new(review_params)
    @review.user_id = current_user.id
    @review.movie_id = @movie.id
    if @review.save
      redirect_to @movie
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to @review
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to root_path, notice: 'Eliminado satisfactoriamente'
  end

  private
  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def find_review
    @review = Review.find(params[:id])
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
end
