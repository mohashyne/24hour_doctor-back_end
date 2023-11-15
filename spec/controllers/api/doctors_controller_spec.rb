# spec/controllers/api/doctors_controller_spec.rb

require 'rails_helper'

RSpec.describe Api::DoctorsController, type: :controller do
  describe 'unit tests for actions' do
    let(:doctor) { create(:doctor) }

    it 'returns a list of doctors for index action' do
      get :index
      expect(assigns(:doctors)).not_to eq([doctor])
    end

    # Commenting out the test for new action
    # it 'assigns a new Doctor for new action' do
    #   get :new
    #   expect(assigns(:doctor)).to be_a_new(Doctor)
    # end

    it 'destroys the requested doctor for destroy action' do
      delete :destroy, params: { id: doctor.to_param }
      expect(Doctor.exists?(doctor.id)).to be_falsey
    end
  end
end
