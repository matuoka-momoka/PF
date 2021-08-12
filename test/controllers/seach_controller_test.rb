require 'test_helper'

class SeachControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get seach_new_url
    assert_response :success
  end

end
