class RestaurantCafesController < ApplicationController
  def index
  end

  def new
    @restaurant_cafe = RestaurantCafe.new
  end

end
