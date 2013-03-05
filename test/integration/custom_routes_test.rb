require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
    test "/login route opens the login page" do
    	get '/login'
    	assert_response :success
    end

    test "/logout route opens the logout page" do
    	get '/logout'
    	assert_response :redirect
    	assert_redirected_to '/'
    end
 
 test "/register route opens the registeration/sign up page" do
    	get '/register'
    	assert_response :success
    end

    test "that a profile page works" do
        get '/johndoe'
        assert_response :success
    end


end
