class FoodsController < ApplicationController

  def index
    @foods = Food.all
  end

  def create
    @users = current_user
    @foods = Food.new(food_params)

  end

  private 
  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity current_user.id)
  end
end
