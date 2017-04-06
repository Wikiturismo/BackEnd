require 'test_helper'

class DepartsControllerTest < ActionDispatch::IntegrationTest

  test 'should destroy department' do
    assert_difference('Depart.count', -1) do
        delete '/departs/1'
    end
  end

  test 'should not destroy department' do
    assert_difference('Depart.count', 0) do
        delete '/departs/150'
    end
  end

end
