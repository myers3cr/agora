require 'test_helper'

class MainControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
    assert_template "index"
  end

  test "should get current messages" do
    get :index
    assert_equal 2, assigns(:messages).size
    assert_select("div.message", 2)
  end

  test "should display default text if no current messages" do
    Message.delete_all
    get :index
    assert_equal 0, assigns(:messages).size
    assert_select("div.default")
  end

end
