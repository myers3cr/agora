require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should login" do
    admin = users(:admin_user)
    post :create, username: admin.username, password: 'secret'
    assert_redirected_to main_url
    assert_equal admin.id, session[:user_id]
  end

  test "wrong username should fail login" do
    admin = users(:admin_user)
    post :create, username: 'nosuchuser', password: 'secret'
    assert_redirected_to login_url
  end

  test "wrong password should fail login" do
    admin = users(:admin_user)
    post :create, username: admin.username, password: 'baddog'
    assert_redirected_to login_url
  end
  
  test "should logout" do
    delete :destroy
    assert_redirected_to main_url
  end

end