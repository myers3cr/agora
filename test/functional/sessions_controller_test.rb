require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should login" do
    admin = users(:admin_user)
    post :create, name: admin.name, password: 'secret'
    assert_redirected_to main_url
    assert_equal admin.id, session[:user_id]
  end

  test "should fail login" do
    admin = users(:admin_user)
    post :create, name: admin.name, password: 'baddog'
    assert_redirected_to login_url
  end
  
  test "should logout" do
    delete :destroy
    assert_redirected_to main_url
  end

end