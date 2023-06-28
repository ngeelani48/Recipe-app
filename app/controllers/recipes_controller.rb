class RecipesController < ApplicationController
  load_and_authorize_resource
  def index
    @recipes = Recipe.all.where(user_id: current_user.id)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)

    respond_to do |format|
      format.html do
        if @recipe.save
          redirect_to recipes_url, notice: 'Recipe was successfully created.'
        else
          render :new, alert: 'Recipe could not be created'
        end
      end
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = 'Recipe deleted successfully'
    redirect_to recipes_url
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
