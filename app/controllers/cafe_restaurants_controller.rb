class CafeRestaurantsController < ApplicationController
  def index
  end

  def new
    @CafeRestaurant = CafeRestaurant.new
  end
end
