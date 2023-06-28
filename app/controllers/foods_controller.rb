class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def create
    @users = current_user
    @foods = Food.new(food_params)
    if @food.save
      redirect_to recipe_foods_path, notice: 'Food was successfully created.'
    else
      render :new, alert: 'Food was not created.'
    end
  end

  def edit; end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity, current_user.id)
  end
end
