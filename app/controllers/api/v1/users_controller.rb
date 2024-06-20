class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  skip_before_action :verify_authenticity_token

  def index
    @users = User.all
    render json: @users, each_serializer: UserSerializer
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
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :date_of_birth, :address)
  end
end
