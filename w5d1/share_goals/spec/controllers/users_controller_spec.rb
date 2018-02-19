require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET #new' do
    it 'renders new user page' do
      get :new

      expect(response).to render_template('new')
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    context 'with invalid params' do
      it 'validates presence of email and password_digest' do
        post :create, params: { user: { email: "EmailWithNoPass@test.com" } }
        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present
      end
    end

    context 'with valid params' do
      it 'redirects to users page' do
        post :create, params: { user: FactoryBot.attributes_for(:user) }
        expect(response).to redirect_to(user_url(user))
      end
    end
  end

end
