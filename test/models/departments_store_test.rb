require 'test_helper'

class DepartmentsStoreTest < ActiveSupport::TestCase
  test "the truth" do
     assert true
   end


   test "should not save without store_id" do
  d = DepartmentsStore.new
  assert !d.save
end

 test "should not save user without department_id" do
 d = DepartmentsStore.new
  assert !d.save
end

end
