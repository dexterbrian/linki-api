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
    links = Link.where(user_id: session[:user_id])
    if links
      render json: links, only: [:id, :title, :url]
    else
      render json: { error: "Link not found" }, status: :not_found
    end
  end

  def update
    begin
      link = Link.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: "Link not found" }, status: :not_found
    else
      if link.update(title: params[:title], url: params[:url])
        render json: link, only: [ :title, :url ]
      else
        render json: { error: "Validation errors" }, status: :not_found
      end
    end
  end

  def destroy
    begin
      link = Link.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: "Link not found" }, status: :not_found
    else
      if link.destroy
        head :no_content
      else
        render json: { error: "Failed to delete the link" }, status: :not_found
      end
    end
  end
end
