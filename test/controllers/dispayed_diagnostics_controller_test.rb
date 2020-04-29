require 'test_helper'

class DispayedDiagnosticsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get dispayed_diagnostics_new_url
    assert_response :success
  end

  test "should get create" do
    get dispayed_diagnostics_create_url
    assert_response :success
  end

end
