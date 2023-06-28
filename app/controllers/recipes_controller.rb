class RecipesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe, only: %i[show edit update destroy]

  def index
    @recipes = current_user.recipes
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @recipe = Recipe.find_by_id(params[:id])
    # @recipe_foods = @recipe.recipe_foods.includes(:food)
    @current_user = current_user
    # @inventories = current_user.inventories
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit; end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    # @recipe.public_recipe = params[:recipe][:public_recipe] == '1'

    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was successfully created.'
    else
      render :new
    end
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
