require 'test_helper'

class PlacesControllerTest < ActionDispatch::IntegrationTest
  test 'should destroy place' do
    assert_difference('Place.count', -1) do
        delete '/places/1'
    end
  end

  test 'should not destroy place' do
    assert_difference('Place.count', 0) do
        delete '/places/150'
    end
  end
end
