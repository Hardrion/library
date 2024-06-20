class Api::V1::FavoritesController < Api::V1::BaseController
  before_action :set_user
  skip_before_action :verify_authenticity_token

  api :GET, "/api/v1/users/:user_id/favorites", "Get user favorites"
  returns code: 200, desc: "Ok"
  returns code: 400, desc: "Bad Request"
  returns code: 401, desc: "Unauthorized"
  returns code: 404, desc: "Not Found"
  returns code: 500, desc: "Internal Server Error"
  param :page, :number, desc: "Page number for pagination"
  example '
  {
    "favorite_books": [
        {
            "id": 62,
            "title": "The Great Adventure",
            "author": "John Smith",
            "country": "USA",
            "publication_date": "2020-01-15",
            "total_chapters": 12
        }
    ],
    "pagy": {
        "current_page": 1,
        "next_page": null,
        "prev_page": null,
        "total_pages": 1,
        "total_count": 1
    }
  }
  '

  def index
    @pagy, @favorites = pagy(@user.favorite_books, items: 5)
    render json: {
      favorite_books: ActiveModelSerializers::SerializableResource.new(@favorites,
                                                                       each_serializer: BookSerializer),
      pagy:           pagy_metadata(@pagy)
    }
  end

  api :POST, "/api/v1/users/:user_id/favorites", "Add book as user's favorite"
  param :book_id, :number, desc: "Book to be added as favorite", required: true
  returns code: 201, desc: "Created"
  returns code: 400, desc: "Bad Request"
  returns code: 401, desc: "Unauthorized"
  returns code: 409, desc: "Conflict"
  returns code: 422, desc: "Unprocessable Entity"
  returns code: 500, desc: "Internal Server Error"
  example '
  {
    "book_id": 63
  }
  '
  def create
    book = Book.find(favorite_params[:book_id])
    existing_favorite = @user.favorites.find_by(book:)

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

  api :DELETE, "/api/v1/users/:user_id/favorites/:book_id", "Delete book from favorites"
  param :book_id, :number, desc: "ID of the user to be deleted"
  returns code: 204, desc: "No Content"
  returns code: 400, desc: "Bad Request"
  returns code: 401, desc: "Unauthorized"
  returns code: 404, desc: "User not found"
  returns code: 500, desc: "Internal Server Error"

  def destroy
    @favorite = @user.favorites.find_by(book_id: params[:book_id])

    if @favorite
      @favorite.destroy
      render json: { message: "Favorite successfully removed" }, status: :ok
    else
      render json: { error: "Favorite not found" }, status: :not_found
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "User not found" }, status: :not_found
  end

  def favorite_params
    params.require(:favorite).permit(:book_id)
  end

  def pagy_metadata(pagy)
    {
      current_page: pagy.page,
      next_page:    pagy.next,
      prev_page:    pagy.prev,
      total_pages:  pagy.pages,
      total_count:  pagy.count
    }
  end
end
