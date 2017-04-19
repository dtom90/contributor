require 'test_helper'

class ContributorsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get contributors_home_url
    assert_response :success
  end

  test "should get show" do
    get contributors_show_url
    assert_response :success
  end

end
