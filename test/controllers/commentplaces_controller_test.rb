require 'test_helper'

class CommentplacesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test 'should destroy commentplace' do
    assert_difference('Commentplace.count', -1) do
        delete '/commentplaces/1'
    end
  end
  test 'should not destroy commentplace' do
    assert_difference('Commentplace.count', 0) do
        delete '/commentplaces/150'
    end
  end
end
