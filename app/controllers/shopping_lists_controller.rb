class ShoppingListsController < ApplicationController
  def index
    @recipe = Recipe.find_by_id(params[:recipe_id])
    @recipes = @recipe.recipe_foods.includes(:food)
    puts @recipes.inspect
  end
end
