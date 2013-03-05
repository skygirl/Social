require 'test_helper'

class StatusTest < ActiveSupport::TestCase
 
   test "a status has content" do
   status = Status.new
   assert !status.save
   assert !status.errors[:content].empty?
end

test "status update is at least 2 charatects long" do
   status = Status.new
   status.content = "H"
   assert !status.save
   assert !status.errors[:content].empty?
end

test "statuses are associated to a User ID" do
	status = Status.new
	status.content = "Hello"
	assert !status.save
    assert !status.errors[:user_id].empty?
end


end
