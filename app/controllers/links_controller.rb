class LinksController < ApplicationController
  def create
    link = Link.create(user_id: session[:user_id], title: params[:title], url: params[:url])
    if link
      render json: link, only: [:title, :url]
    else
      render json: { error: "validation errors" }, status: :not_found
    end
  end

  def show
  end

  def update
  end

  def delete
  end
end
