require 'test_helper'

class Master::SpecsControllerTest < ActionController::TestCase
  setup do
    @master_spec = master_specs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:master_specs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create master_spec" do
    assert_difference('Master::Spec.count') do
      post :create, :master_spec => @master_spec.attributes
    end

    assert_redirected_to master_spec_path(assigns(:master_spec))
  end

  test "should show master_spec" do
    get :show, :id => @master_spec.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @master_spec.to_param
    assert_response :success
  end

  test "should update master_spec" do
    put :update, :id => @master_spec.to_param, :master_spec => @master_spec.attributes
    assert_redirected_to master_spec_path(assigns(:master_spec))
  end

  test "should destroy master_spec" do
    assert_difference('Master::Spec.count', -1) do
      delete :destroy, :id => @master_spec.to_param
    end

    assert_redirected_to master_specs_path
  end
end
