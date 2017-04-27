require 'test_helper'

class ImageusersControllerTest < ActionDispatch::IntegrationTest
  test 'should destroy imageuser' do
    assert_difference('Imageuser.count', -1) do
        delete '/imageusers/1'
    end
  end

  test 'should not destroy imageuser' do
    assert_difference('Imageuser.count', 0) do
        delete '/imageusers/150'
    end
  end

  test "should update imageuser" do
    path = "path/nuevo"
    post imageusers_url, params: { imageusers: { id: '', height: '' , width:'', path:path, town_id:3 , imagen:''} }
  end
end
