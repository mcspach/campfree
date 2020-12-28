class sitesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    if params[:state].present?
      if params[:state] == 'All States'
        @site = Site.all
      else
        @sites = Site.where("state ILIKE ? ", params[:state])
      end
    else
      @sites = Site.all
    end
  end

  def show
    @site = Site.find(params[:id])
    @trip = Trip.new
    @markers = [{
          lat: @site.latitude,
          lng: @site.longitude
      }]
  end

  def new
    @site = Site.new
  end

  def create
    @site = Site.new(site_params)
    @site.user = current_user
    if @site.save
      redirect_to site_path(@site), notice: "You have successfully listed your site!"
    else
      render :new
    end
  end

  def edit
    @site = Site.find(params[:id])
  end

  def update
    @site = Site.find(params[:id])
    @site.update(site_params)
    redirect_to site_path(@site)
  end

  def destroy
    @site = Site.find(params[:id])
    @site.destroy
    redirect_to root_path, notice: "Thank you for using Outpost"
  end

  private

  def site_params
    params.require(:site).permit(:title, :description, :price, :state, :address, :user_id, :latitude, :longitude, photos: [])
  end
end
