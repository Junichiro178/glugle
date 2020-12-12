class MenusController < ApplicationController

  def create
    @cafe_restaurant = CafeRestaurant.includes(:images).find(params[:cafe_restaurant_id])
    @menu = Menu.create(menu_params)
    if @menu.save
      redirect_to cafe_restaurant_path(@menu)
    else
      redirect_to cafe_restaurant_path(@cafe_restaurant), alert: "メニューが登録できませんでした"
    end
  end

  private
  def menu_params
    params.require(:menu).permit(
      :name,
      :price,
      :image, 
      :description,
      { menu_category_ids: [] }
      )
      .merge(cafe_restaurant_id: params[:cafe_restaurant_id])
  end

end
