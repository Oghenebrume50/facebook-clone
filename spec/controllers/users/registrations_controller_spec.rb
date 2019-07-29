require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
    describe "register new user " do
        context "when user registration succeeds" do
          it "creates a user" do
            expect { FactoryBot.create(:user)}.to change(User, :count).by(1)
          end  
        end
    
        context "when user registration fails" do
            it "don't create a user" do
              expect { 
                User.create(
                    name:  nil,
                    email:      "tester@example.com",
                    password:   "123456",      
                  )
              }.to_not change(User, :count)
            end  
        end
      end        
end
