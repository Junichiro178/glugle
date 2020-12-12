class MenusController < ApplicationController

  def create
    @menu = Menu.create(menu_params)
    if @menu.save
      redirect_to  cafe_restaurant_path(@menu)
    end
  end

  private
  def menu_params
    params.require(:menu).permit(
      :name,
      :price,
      :image, 
      :description,
      )
      .merge(cafe_restaurant_id: params[:cafe_restaurant_id])
  end

end
