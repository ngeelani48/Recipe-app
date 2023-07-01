require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Recipe Show Page', type: :feature do
  include Capybara::DSL
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'nafees', email: 'engineer@gmail.com', password: '123456') }
  let(:recipe) do
    Recipe.create(name: 'Pizza', cooking_time: 15, preparation_time: 30, description: 'Delicious pizza', public: true,
                  user:)
  end

  before do
    sign_in user
    visit recipe_path(recipe)
  end

  it 'displays the recipe details' do
    expect(page).to have_content(recipe.name)
    expect(page).to have_content("Preparation Time: #{recipe.preparation_time} minutes")
    expect(page).to have_content("Cooking Time: #{recipe.cooking_time} minutes")
    expect(page).to have_content("Description: #{recipe.description}")
    expect(page).to have_content('Public: Yes')
  end

  it 'displays the "Back to Recipes" link' do
    expect(page).to have_link('Back to Recipes', href: recipes_path)
  end

  it 'displays the "Delete Recipe" button' do
    expect(page).to have_button('Delete Recipe')
  end

  it 'displays the "Public" checkbox' do
    expect(page).to have_field('Public')
  end

  it 'displays the "Generate Shopping List" link' do
    expect(page).to have_link('Generate Shopping List', href: shopping_lists_path(recipe_id: recipe.id))
  end

  it 'displays the "Add Ingredients" button' do
    expect(page).to have_button('Add Ingredients')
  end

  it 'displays the recipe foods table' do
    expect(page).to have_selector('table.recipe-table')
  end
end
