require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:maytee).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end

  test "should return a 404 - profile isn't found" do
  	get :show, id: "doesn't exist"
  	assert_response :not_found
  end

  test "variables are assigned on successful  profile views" do
    get :show, id: users(:maytee).profile_name
    assert assigns(:user)
    assert_not_empty assigns(:statuses)
end

  test "only shows the correct user's statuses" do
  	get :show, id: users(:maytee).profile_name
  	assigns(:statuses).each do |status|
  		assert_equal users(:maytee), status.user
  		
  	end
end


end
