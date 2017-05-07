require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get static_pages_about_url
    assert_response :success
  end

  test "should get privacy" do
    get static_pages_privacy_url
    assert_response :success
  end

  test "should get agreement" do
    get static_pages_agreement_url
    assert_response :success
  end

  test "should get organization" do
    get static_pages_organization_url
    assert_response :success
  end

end
