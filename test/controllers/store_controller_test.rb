require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get search" do
    get :search
    assert_response :success
  end

  test "should get search_results" do
    get :search_results
    assert_response :success
  end

end
