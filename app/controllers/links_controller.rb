class LinksController < ApplicationController
  skip_before_action :require_login, only: [:show]

  def create
    user = load_user_from_url
    link = user.links.new(link_params)
    if link.save
      redirect_to root
    else
      render :root
    end
  end

  def show
    slug = slug_params
    link = Link.find_by(:slug, slug)
    link.clicks.create
    redirect_to link.url
  end
end
