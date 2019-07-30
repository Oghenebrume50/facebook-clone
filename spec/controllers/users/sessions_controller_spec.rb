require 'rails_helper'

RSpec.describe Users::SessionsController, type: :controller do
    before do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        @user = FactoryBot.create(:user)
    end
    describe "create new session" do
        context "when login succeeds" do
          it "creates a sessions" do
            sign_in @user
            expect(response).to have_http_status(:success)
          end  
        end
    
        context "when login fails" do
            it "should not create sessions" do
                user = User.create(
                    name:  "Test User",
                    email:      "tester@example.com",
                    password:   "12345",      
                  )
              sign_in user
              expect(subject.current_user).to eq(nil)
            end  
        end
      end   

      describe "destroy session" do
        context "when logout succeeds" do
          it "creates destroys session" do
            sign_in @user
            sign_out @user
            expect(subject.current_user).to eq(nil)
          end  
        end
      end   
 end
