require 'test_helper'

class ContributorsControllerTest < ActionDispatch::IntegrationTest
  test 'should get home' do
    get root_url
    assert_response :success
  end

  test 'should get show' do
    get '/dtom90'
    assert_response :success
  end

end
