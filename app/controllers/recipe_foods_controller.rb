class RecipeFoodsController < ApplicationController
  before_action :set_recipe_food, only: %i[show edit update destroy]

  def new
    @user = current_user
    @recipe = Recipe.find_by_id(params[:recipe_id])
    @available_food = Foods.all
    @recipe_foods = RecipeFood.new
  end

  def create
    @recipe_food = RecipeFood.new
    @recipe_food.recipe_id = params[:recipe_id]
    @recipe_food.food_id = params[:food_id]
    @recipe_food.quantity = params[:quantity]

    if @recipe_food.save
      redirect_to recipe_foods_path(params[:recipe_id]), notice: 'Recipe food was created successfully'
    else
      render 'new'
    end
  end

  def edit
    @recipe_food = RecipeFood.find(params[:id])
  end

  def update
    # Your code for the "update" action
  end

  def destroy
    @recipe_food = RecipeFood.find_by_id(params[:id])
    if @recipe_food.destroy
      flash[:success] = 'Ingredient deleted.'
    else
      flash[:fail] = 'Ingredient not deleted.'
    end
    redirect_to recipe_foods_path(params[:recipe_id]), method: :get
  end

  private

  def set_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
  end

  def recipe_food_params
    params.permit(:quantity, :food_id, :recipe_id)
  end
end
