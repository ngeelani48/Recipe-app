class PublicRecipesController < ApplicationController
  def index
    @recipes = public_recipes
    @user = current_user
  end
  
  private
  
  def public_recipes
    Recipe.where(public: true).order(created_at: :desc).includes(:user, :recipe_foods).each do |recipe|
    recipe.recipe_foods.includes(:food).sort_by { |recipe_food| recipe_food.food.name }
    end
  end
end
