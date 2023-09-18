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
    links = Link.find_by(user_id: session[:user_id])
    if links
      render json: links, only: [:title, :url]
    else
      render json: { error: "Link not found" }, status: :not_found
    end
  end

  def update
  end

  def delete
  end
end
