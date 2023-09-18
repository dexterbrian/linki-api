class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:username])
    if user
      session[:user_id] = user.id
      render json: user, only: [ :username]
    else
      render json: { error: "User not found" }, status: :not_found
    end
  end

  def destroy
    session.delete :user_id
    head :no_content
  end
end
