class Api::V1::FavoritesController < ApplicationController
  before_action :set_user
  skip_before_action :verify_authenticity_token

  # GET /api/v1/users/:user_id/favorites
  def index
    @favorites = @user.favorite_books
    render json: @favorites, status: :ok
  end

  def create
    book = Book.find(favorite_params[:book_id])
    existing_favorite = @user.favorites.find_by(book: book)

    if existing_favorite
      render json: @favorite.errors, status: :conflict
    else
      @favorite = @user.favorites.new(favorite_params)
      if @favorite.save
        render json: @favorite, status: :created
      else
        render json: @favorite.errors, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @favorite = @user.favorites.find_by(book_id: params[:book_id])

    if @favorite
      @favorite.destroy
      render json: { message: 'Favorite successfully removed' }, status: :ok
    else
      render json: { error: 'Favorite not found' }, status: :not_found
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'User not found' }, status: :not_found
  end

  def favorite_params
    params.require(:favorite).permit(:book_id)
  end
  
end
