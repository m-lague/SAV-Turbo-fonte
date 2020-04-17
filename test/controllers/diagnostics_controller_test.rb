require 'test_helper'

class DiagnosticsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get diagnostics_show_url
    assert_response :success
  end

end
