require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "a user should enter a first name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end

  test "a user should enter a last name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end

	test "a user should enter a profile name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have a unique profile name" do
   user = User.new
   user.profile_name = users(:maytee).profile_name
  
  assert !user.save
    assert !user.errors[:profile_name].empty?
   end

   test "a user should not have spaces in their profile name" do
    user = User.new(first_name: 'Maytee', last_name: 'Kneitz', email: 'maytee.kneitz2@gmail.com')
    user.password = user.password_confirmation = 'password'

    
    user.profile_name = "Has spaces"

    assert !user.save
    assert !user.errors[:profile_name].empty?
    assert user.errors[:profile_name].include?("Must be formated correctly")

 end

  test "a user has a correctly formatted user name" do
    user = User.new(first_name: 'Maytee', last_name: 'Kneitz', email: 'maytee.kneitz2@gmail.com')
    user.password = user.password_confirmation = 'password'

    user.profile_name = 'mayteekneitz_2'
    assert user.valid?
  end
end
