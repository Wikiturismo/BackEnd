require 'test_helper'

class ImagetownsControllerTest < ActionDispatch::IntegrationTest
  test 'should destroy imagetown' do
    assert_difference('Imagetown.count', -1) do
        delete '/imagetowns/1'
    end
  end

  test 'should not destroy imagetown' do
    assert_difference('Imagetown.count', 0) do
        delete '/imagetowns/150'
    end
  end

  test "should update imagetown" do
    path = "path/nuevo"
    post imagetowns_url, params: { imagetowns: { id: '', height: '' , width:'', path:path, town_id:3 , imagen:''} }
  end
end
