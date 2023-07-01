require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'Nafees Geelani', email: 'engnr@gmail.com', password: '654321') }
  let(:food) { user.foods.create(name: 'Apple', measurement_unit: 'kg', price: 2) }

  describe 'GET /index' do
    before do
      sign_in user
      get foods_path
    end

    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end

    it 'should respond with HTML' do
      expect(response.content_type).to include 'text/html'
    end

    it 'should include the correct placeholder' do
      expect(response.body).to include('Add food')
    end

    it 'should display the food name in the table' do
      expect(response.body).to include('Food')
    end

    it 'should display the measurement unit in the table' do
      expect(response.body).to include('Measurement')
    end

    it 'should display the price in the table' do
      expect(response.body).to include('Unit Price')
    end
  end
end
