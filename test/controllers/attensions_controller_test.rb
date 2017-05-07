require 'test_helper'

class AttensionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attension = attensions(:one)
  end

  test "should get index" do
    get attensions_url
    assert_response :success
  end

  test "should get new" do
    get new_attension_url
    assert_response :success
  end

  test "should create attension" do
    assert_difference('Attension.count') do
      post attensions_url, params: { attension: {  } }
    end

    assert_redirected_to attension_url(Attension.last)
  end

  test "should show attension" do
    get attension_url(@attension)
    assert_response :success
  end

  test "should get edit" do
    get edit_attension_url(@attension)
    assert_response :success
  end

  test "should update attension" do
    patch attension_url(@attension), params: { attension: {  } }
    assert_redirected_to attension_url(@attension)
  end

  test "should destroy attension" do
    assert_difference('Attension.count', -1) do
      delete attension_url(@attension)
    end

    assert_redirected_to attensions_url
  end
end
