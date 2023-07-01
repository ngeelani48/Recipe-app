require 'rails_helper'

RSpec.describe 'Recipes', type: :feature do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'nafees', email: 'engineer@gmail.com', password: '123456') }
  let!(:recipe1) do
    Recipe.create(name: 'Pizza', cooking_time: 15, preparation_time: 30, description: 'Delicious pizza', public: true,
                  user:)
  end
  let!(:recipe2) do
    Recipe.create(name: 'Pasta', cooking_time: 20, preparation_time: 25, description: 'Tasty pasta', public: false,
                  user:)
  end

  before do
    sign_in user
    visit recipes_path
  end

  it 'should return response status correct (ok)' do
    expect(page.status_code).to eq(200)
  end

  it 'displays the page title' do
    expect(page).to have_content('My Recipes')
  end

  it 'displays the "Add New Recipe" button' do
    expect(page).to have_link('Add New Recipe', href: new_recipe_path)
  end

  it 'displays the recipe cards' do
    expect(page).to have_selector('.recipe-card')
  end

  it 'displays the recipe name, preparation time, cooking time, description, and public status' do
    expect(page).to have_content('Pizza')
    expect(page).to have_content('30 minutes')
    expect(page).to have_content('15 minutes')
    expect(page).to have_content('Delicious pizza')
    expect(page).to have_content('Public: Yes')

    expect(page).to have_content('Pasta')
    expect(page).to have_content('25 minutes')
    expect(page).to have_content('20 minutes')
    expect(page).to have_content('Tasty pasta')
    expect(page).to have_content('Public: No')
  end

  it 'displays the "View Recipe" link for each recipe' do
    expect(page).to have_link('View Recipe', href: recipe_path(recipe1))
    expect(page).to have_link('View Recipe', href: recipe_path(recipe2))
  end

  it 'displays the "Delete Recipe" button for each recipe' do
    expect(page).to have_css('.delete-button', text: 'Delete Recipe', count: 2)
  end
end
