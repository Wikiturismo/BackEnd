require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test 'should destroy user' do
    assert_difference('User.count', -1) do
        delete '/users/1'
    end
  end
  test 'should not destroy user' do
      assert_difference('User.count', 0) do
          delete '/users/150'
      end
  end
end
