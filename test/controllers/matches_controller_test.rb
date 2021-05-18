require 'test_helper'

class MatchesControllerTest < ActionDispatch::IntegrationTest
  test "should get main" do
    get matches_main_url
    assert_response :success
  end

  test "should get match" do
    get matches_match_url
    assert_response :success
  end

end
