class LinksController < ApplicationController
  skip_before_action :require_login, only: [:show]

  def create
    user = load_user_from_url
    link = user.links.new(link_params)
    if link.save
      redirect_to root_path
    else
      render :root
    end
  end

  def show
    slug = slug_params
    link = Link.find_by(slug: slug)
    uri = URI.parse(link.url)
    binding.pry
    link.clicks.create
    redirect_to link.url
  end

  private

  def load_user_from_url
    User.find(params[:user_id])
  end

  def link_params
    params.require(:link).permit(:url)
  end

  def slug_params
    params[:slug]
  end
end
