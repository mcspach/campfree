class TentsController < ApplicationController

  def index
    @tent = Tent.all
  end

  def show
    @tent = Tent.find(params[:id])
  end

  def new
    @tent = Tent.new
  end

  def create
    @tent = Tent.new(tent_params)
    @tent.user = current_user
    if @tent.save
      redirect_to tent_path(@tent), notice: "You have successfully listed your tent!"
    else
      render :new
    end
  end
  
  def edit
    @tent = Tent.find(params[:id])
  end

  def update
    @tent = Tent.find(params[:id])
    @tent.update(tent_params)
    redirect_to tent_path(@user)
  end

  def destroy
    @tent = Tent.find(params[:id])
    @tent.destroy
    redirect_to root_path, notice:"Thank you for using Outpost fucker!"
  end

  private

  def tent_params
    params.require(:tent).permit(:title, :description, :price, :location, :user_id, :photo) # We will need to create a variable for photo
  end

end
