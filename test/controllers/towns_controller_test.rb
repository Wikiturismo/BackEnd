require 'test_helper'

class TownsControllerTest < ActionDispatch::IntegrationTest
  test 'should destroy town' do
    assert_difference('Town.count', -1) do
        delete '/towns/1'
    end
  end

  test 'should not destroy town' do
    assert_difference('Town.count', 0) do
        delete '/towns/150'
    end
  end
end
