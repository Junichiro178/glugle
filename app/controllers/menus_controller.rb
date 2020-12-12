class MenusController < ApplicationController

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.create(menu_params)
  end

  private
  def menu_params
    params.require(:menu).permit(
      :name,
      :price,
      :image, 
      :description,
      )
      .merge(cafe_restaurant_id: params[:cafe_restaurant.id])
  end

end
