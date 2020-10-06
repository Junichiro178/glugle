class CafeRestaurantsController < ApplicationController
  def index
  end

  def new
    @cafe_restaurant = CafeRestaurant.new
  end

  def create
    @cafe_restaurant = CafeRestaurant.new(cafe_restaurant_params)
    if @cafe_restaurant.save
      redirect_to root_path
    else
      redirect_to root_path, alert: "お店を登録できませんでした"
    end
  end

  private

  def cafe_restaurant_params
    params.require(:cafe_restaurant).permit(
      :name,
      :phonetic_name,
      :phone_number, 
      :description,
      :opening_hours, 
      :regular_holidays, 
      :prefecture, 
      :city_ward, 
      :block_number, 
      :building_name
      )
      .merge(owner_id: current_user.id)
  end
end
