class ShoppingListsController < ApplicationController
  def index
    recipe_id = session[:recipe_id]
    @recipe = Recipe.find_by_id(recipe_id)
    @recipes = @recipe.recipe_foods.includes(:food)
  end
end
