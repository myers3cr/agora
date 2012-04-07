require 'test_helper'

class Admin::UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:admin_user)
    @input_attributes = {
      username: "Alice",
      org_id: Org.first.id,
      first_name: "Alice",
      last_name: "Toklas",
      email: "alicebtoklas@stein.com",
      phone: "(585) 555-1212",
      password: "password",
      password_confirmation: "password"
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: @input_attributes
    end
    assert_redirected_to admin_users_path
  end

  test "should show user" do
    get :show, id: @user.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user.to_param
    assert_response :success
  end

  test "should update user" do
    put :update, id: @user.to_param, user: @input_attributes
    assert_redirected_to admin_users_path
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user.to_param
    end
    assert_redirected_to admin_users_path
  end
end
