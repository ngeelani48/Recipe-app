class UsersController < ApplicationController
  def index
    @recipes = Recipe.all
    render 'recipes/index'
  end
end
