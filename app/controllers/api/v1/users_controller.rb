class Api::V1::UsersController < Api::V1::BaseController
  before_action :set_user, only: %i[show update destroy]
  skip_before_action :verify_authenticity_token

  api :GET, "/api/v1/users", "Get users list"
  returns code: 200, desc: "Ok"
  returns code: 400, desc: "Bad Request"
  returns code: 401, desc: "Unauthorized"
  returns code: 404, desc: "Not Found"
  returns code: 500, desc: "Internal Server Error"
  param :page, :number, desc: "Page number for pagination"

  example '
  {
    "users": [
        {
            "id": 43,
            "first_name": "John",
            "last_name": "Doe",
            "email": "john.doe@example.com",
            "date_of_birth": "1990-01-01",
            "address": "123 Main St"
        },
        {
            "id": 44,
            "first_name": "Jane",
            "last_name": "Smith",
            "email": "jane.smith@example.com",
            "date_of_birth": "1985-05-05",
            "address": "456 Elm St"
        }
    ],
    "pagy": {
        "current_page": 1,
        "next_page": 2,
        "prev_page": null,
        "total_pages": 2,
        "total_count": 10
    }
  }
  '

  def index
    @pagy, @users = pagy(User.all, items: 5)
    render json: {
      users: ActiveModelSerializers::SerializableResource.new(@users,
                                                              each_serializer: UserSerializer),
      pagy:  pagy_metadata(@pagy)
    }
  end

  api :GET, "/api/v1/users/:id", "Show user"
  returns code: 200, desc: "Ok"
  returns code: 400, desc: "Bad Request"
  returns code: 401, desc: "Unauthorized"
  returns code: 404, desc: "Not Found"
  returns code: 500, desc: "Internal Server Error"

  example '
  {
    "id": 45,
    "first_name": "Alice",
    "last_name": "Johnson",
    "email": "alice.johnson@example.com",
    "date_of_birth": "1992-03-12",
    "address": "789 Pine St"
  }
  '

  def show
    if @user.present?
      render json: @user, serializer: UserSerializer, status: :ok
    else
      render json: @user.as_json, status: :not_found
    end
  end

  api :POST, "/api/v1/users", "Create user"
  param :first_name, String, desc: "First name", required: true
  param :last_name, String, desc: "Last name", required: true
  param :email, String, desc: "Email address", required: true
  param :date_of_birth, Date, desc: "Date of birth", required: true
  param :address, String, desc: "Address", required: true
  returns code: 201, desc: "Created"
  returns code: 400, desc: "Bad Request"
  returns code: 401, desc: "Unauthorized"
  returns code: 422, desc: "Unprocessable Entity"
  returns code: 500, desc: "Internal Server Error"
  example '
   {
    "first_name": "John",
    "last_name": "Doe",
    "email": "john.doe@gmail.com",
    "date_of_birth": "2001-01-01",
    "address": "Talisay City, Cebu"
  }
  '

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, serializer: UserSerializer, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  api :PUT, "/api/v1/users/:id", "Create user"
  param :id, :number, desc: "ID of the user"
  param :first_name, String, desc: "First name"
  param :last_name, String, desc: "Last name"
  param :email, String, desc: "Email address"
  param :date_of_birth, Date, desc: "Date of birth"
  param :address, String, desc: "Address"
  returns code: 200, desc: "Ok"
  returns code: 400, desc: "Bad Request"
  returns code: 401, desc: "Unauthorized"
  returns code: 422, desc: "Unprocessable Entity"
  returns code: 500, desc: "Internal Server Error"
  example '
  {
   "first_name": "John",
   "last_name": "Doe",
   "email": "john.doe@gmail.com",
   "date_of_birth": "2001-01-01",
   "address": "Talisay City, Cebu"
 }
 '

  def update
    if @user.update(user_params)
      render json: @user, serializer: UserSerializer
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  api :DELETE, "/api/v1/users/:id", "Delete user"
  param :id, :number, desc: "ID of the user to be deleted"
  returns code: 204, desc: "No Content"
  returns code: 404, desc: "User not found"
  returns code: 500, desc: "Internal Server Error"

  def destroy
    @user.destroy
    head :no_content
  end

  private

  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "User not found" }, status: :not_found
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :date_of_birth, :address)
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
