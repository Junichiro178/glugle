class CafeRestaurantsController < ApplicationController
  def index
  end

  def new
    @cafe_restaurant = CafeRestaurant.new
    @images = @cafe_restaurant.images.new
  end

  def create
    @cafe_restaurant = CafeRestaurant.new(cafe_restaurant_params)
    if @cafe_restaurant.save
      redirect_to  cafe_restaurant_path(@cafe_restaurant)
    else
      redirect_to new_cafe_restaurant_path, alert: "お店を登録できませんでした"
    end
  end

  def show
    @cafe_restaurant = CafeRestaurant.includes(:images).find(params[:id])
    @prefecture = Prefecture.find(@cafe_restaurant.prefecture_id)
  end

  private

  def cafe_restaurant_params
    params.require(:cafe_restaurant).permit(
      :name,
      :phonetic_name,
      :phone_number, 
      :description,
      { category_ids: [] },
      :opening_hours, 
      :regular_holidays, 
      :prefecture_id,
      :city_ward, 
      :block_number, 
      :building_name,
      images_attributes: [ :image, :id]
      )
      .merge(owner_id: current_user.id)
  end
end
