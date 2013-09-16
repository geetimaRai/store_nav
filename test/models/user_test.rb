require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "the truth" do
     assert true
   end

   test "should not save user without email" do
  user = User.new
  assert !user.save
end

 test "should not save user without name" do
  user = User.new
  assert !user.save
end

test "should report error" do
  # some_undefined_variable is not defined elsewhere in the test case
  random_undefined_variable
  assert true
end

end
