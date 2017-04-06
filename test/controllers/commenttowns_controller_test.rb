require 'test_helper'

class CommenttownsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test 'should destroy commenttown' do
    assert_difference('Commenttown.count', -1) do
        delete '/commenttowns/1'
    end
  end
  test 'should not destroy commenttown' do
    assert_difference('Commenttown.count', 0) do
        delete '/commenttowns/150'
    end
  end
end
