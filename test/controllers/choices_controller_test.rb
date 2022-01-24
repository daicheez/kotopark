require 'test_helper'

class ChoicesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get choices_create_url
    assert_response :success
  end

end
