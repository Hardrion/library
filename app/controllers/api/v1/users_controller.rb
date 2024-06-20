class Api::V1::UsersController < Api::V1::BaseController
  before_action :set_user, only: [:show, :update, :destroy]
  skip_before_action :verify_authenticity_token

  def index
    @pagy, @users = pagy(User.all, items: 5)
    #render json: {{users: @users,each_serializer: UserSerializer}, pagy: pagy_metadata(@pagy)}, , status: :ok
    render json: {
      users: ActiveModelSerializers::SerializableResource.new(@users,
                                                               each_serializer: UserSerializer),
                                                               pagy:   pagy_metadata(@pagy)
    }
  end


  def show
    @user = User.find_by(id: params[:id])
    if @user.present?
      render json: @user, serializer: UserSerializer
    else
      render json: @user.as_json, status: :not_found
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, serializer: UserSerializer, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: @user, serializer: UserSerializer
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private

  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'User not found' }, status: :not_found
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
