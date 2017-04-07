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

  test "should update imagedepart" do
    path = "path/nuevo"
    post imagedeparts_url, params: { imagedeparts: { id: '', height: '' , width:'', path:path, depart_id:3 , imagen:''} }
  end
  #test "should create imagedepartment" do
  #  assert_difference('Imagedepart.count') do
  #    post imagedeparts_url, params: { imagedeparts: { id: 1000, height: 500 , width:500, path:"path/real", depart_id:3 , imagen:"imageeeeennnn"} }
  #  end
  #  assert_redirected_to '/imagedeparts/1000'
  #end

end
