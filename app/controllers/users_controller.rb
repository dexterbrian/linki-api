class UsersController < ApplicationController
  def create
    user = User.create(username: params[:username], password: params[:password])
    if user
      render json: user, only: [:username]
    else
      render json: { error: "validation errors" }, status: :not_found
    end
  end

  def show
    user = User.find_by(id: session[:user_id])
    if user
      render json: user, only: [ :username]
    else
      render json: { error: "Not authorized" }, status: :unauthorized
    end
  end
end
