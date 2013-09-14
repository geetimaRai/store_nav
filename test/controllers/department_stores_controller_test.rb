require 'test_helper'

class DepartmentStoresControllerTest < ActionController::TestCase
  setup do
    @department_store = department_stores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:department_stores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create department_store" do
    assert_difference('DepartmentStore.count') do
      post :create, department_store: { department_id: @department_store.department_id, store_id: @department_store.store_id }
    end

    assert_redirected_to department_store_path(assigns(:department_store))
  end

  test "should show department_store" do
    get :show, id: @department_store
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @department_store
    assert_response :success
  end

  test "should update department_store" do
    patch :update, id: @department_store, department_store: { department_id: @department_store.department_id, store_id: @department_store.store_id }
    assert_redirected_to department_store_path(assigns(:department_store))
  end

  test "should destroy department_store" do
    assert_difference('DepartmentStore.count', -1) do
      delete :destroy, id: @department_store
    end

    assert_redirected_to department_stores_path
  end
end
