# require 'rails_helper'
# require_relative '../support/devise'

# RSpec.describe UsersController do
#     login_user
  
#     it "should have a current_user" do
#       # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
#       expect(subject.current_user).to_not eq(nil)
#     end
  
#     it "should get index" do
#       # Note, rails 3.x scaffolding may add lines like get :index, {}, valid_session
#       # the valid_session overrides the devise login. Remove the valid_session from your specs
#       get 'index'
#       response.should be_success
#     end
# end