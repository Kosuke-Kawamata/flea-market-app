require 'test_helper'

class AssessmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get assessments_create_url
    assert_response :success
  end

end
