require 'rails_helper'
require_relative '../support/devise'

RSpec.describe UsersController do
    login_user
  
    it "should have a current_user" do
      expect(subject.current_user).to_not eq(nil)
    end
  
    it "should get index" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "should get show" do
        get :show, params: { id: :user}
        expect(response).to have_http_status(:success)
    end
      
end