require 'test_helper'

class DepartmentsStoresControllerTest < ActionController::TestCase
  setup do
    @departments_store = departments_stores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:departments_stores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create departments_store" do
    assert_difference('DepartmentsStore.count') do
      post :create, departments_store: { department_id: @departments_store.department_id, store_id: @departments_store.store_id }
    end

    assert_redirected_to departments_store_path(assigns(:departments_store))
  end

  test "should show departments_store" do
    get :show, id: @departments_store
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @departments_store
    assert_response :success
  end

  test "should update departments_store" do
    patch :update, id: @departments_store, departments_store: { department_id: @departments_store.department_id, store_id: @departments_store.store_id }
    assert_redirected_to departments_store_path(assigns(:departments_store))
  end

  test "should destroy departments_store" do
    assert_difference('DepartmentsStore.count', -1) do
      delete :destroy, id: @departments_store
    end

    assert_redirected_to departments_stores_path
  end
end
