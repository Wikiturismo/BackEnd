require 'test_helper'

class ImgtownsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @imgtown = imgtowns(:one)
  end

  test "should get index" do
    get imgtowns_url
    assert_response :success
  end

  test "should get new" do
    get new_imgtown_url
    assert_response :success
  end

  test "should create imgtown" do
    assert_difference('Imgtown.count') do
      post imgtowns_url, params: { imgtown: { description: @imgtown.description, image: @imgtown.image, name: @imgtown.name } }
    end

    assert_redirected_to imgtown_url(Imgtown.last)
  end

  test "should show imgtown" do
    get imgtown_url(@imgtown)
    assert_response :success
  end

  test "should get edit" do
    get edit_imgtown_url(@imgtown)
    assert_response :success
  end

  test "should update imgtown" do
    patch imgtown_url(@imgtown), params: { imgtown: { description: @imgtown.description, image: @imgtown.image, name: @imgtown.name } }
    assert_redirected_to imgtown_url(@imgtown)
  end

  test "should destroy imgtown" do
    assert_difference('Imgtown.count', -1) do
      delete imgtown_url(@imgtown)
    end

    assert_redirected_to imgtowns_url
  end
end
