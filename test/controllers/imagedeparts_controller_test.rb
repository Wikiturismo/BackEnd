require 'test_helper'

class ImagedepartsControllerTest < ActionDispatch::IntegrationTest

  test 'should destroy imagedepartment' do
    assert_difference('Imagedepart.count', -1) do
        delete '/imagedeparts/1'
    end
  end

  test 'should not destroy imagedepartment' do
    assert_difference('Imagedepart.count', 0) do
        delete '/imagedeparts/150'
    end
  end

end
