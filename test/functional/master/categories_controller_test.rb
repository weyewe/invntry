require 'test_helper'

class Master::CategoriesControllerTest < ActionController::TestCase
  setup do
    @master_category = master_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:master_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create master_category" do
    assert_difference('Master::Category.count') do
      post :create, :master_category => @master_category.attributes
    end

    assert_redirected_to master_category_path(assigns(:master_category))
  end

  test "should show master_category" do
    get :show, :id => @master_category.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @master_category.to_param
    assert_response :success
  end

  test "should update master_category" do
    put :update, :id => @master_category.to_param, :master_category => @master_category.attributes
    assert_redirected_to master_category_path(assigns(:master_category))
  end

  test "should destroy master_category" do
    assert_difference('Master::Category.count', -1) do
      delete :destroy, :id => @master_category.to_param
    end

    assert_redirected_to master_categories_path
  end
end
