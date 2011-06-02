require 'test_helper'

class Master::ItemsControllerTest < ActionController::TestCase
  setup do
    @master_item = master_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:master_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create master_item" do
    assert_difference('Master::Item.count') do
      post :create, :master_item => @master_item.attributes
    end

    assert_redirected_to master_item_path(assigns(:master_item))
  end

  test "should show master_item" do
    get :show, :id => @master_item.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @master_item.to_param
    assert_response :success
  end

  test "should update master_item" do
    put :update, :id => @master_item.to_param, :master_item => @master_item.attributes
    assert_redirected_to master_item_path(assigns(:master_item))
  end

  test "should destroy master_item" do
    assert_difference('Master::Item.count', -1) do
      delete :destroy, :id => @master_item.to_param
    end

    assert_redirected_to master_items_path
  end
end
