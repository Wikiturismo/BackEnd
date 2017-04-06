require 'test_helper'

class ImageplacesControllerTest < ActionDispatch::IntegrationTest
  test 'should destroy imageplace' do
    assert_difference('Imageplace.count', -1) do
        delete '/imageplaces/1'
    end
  end

  test 'should not destroy imageplace' do
    assert_difference('Imageplace.count', 0) do
        delete '/imageplaces/150'
    end
  end
end
