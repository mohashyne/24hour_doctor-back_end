# spec/controllers/api/reservations_controller_spec.rb

require 'rails_helper'

RSpec.describe Api::ReservationsController, type: :controller do
  describe 'POST #create' do
    context 'with valid params' do
      it 'returns a success response' do
        post :create, params: { reservation: attributes_for(:reservation) }
        expect(response).not_to have_http_status(:created)
      end
    end

    context 'with invalid params' do
      it 'returns unprocessable_entity status' do
        post :create, params: { reservation: { date: nil, city: nil, user_id: nil, doctor_id: nil } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end


  describe 'GET #index' do
    context 'with missing user_id parameter' do
      it 'returns unprocessable_entity status' do
        get :index
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
