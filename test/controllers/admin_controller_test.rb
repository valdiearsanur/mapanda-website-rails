require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get login," do
    get :login,
    assert_response :success
  end

  test "should get index," do
    get :index,
    assert_response :success
  end

  test "should get portofolio" do
    get :portofolio
    assert_response :success
  end

end
