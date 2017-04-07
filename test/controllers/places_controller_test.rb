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

  test "should create place" do
    assert_difference('Place.count') do
      post places_url, params: { places: { id: 1000, name: "la fonda" , state: true, publicationdate: "2017-03-20 00:00:00", description: "un lugar muy lindo", ubication: "cerca a tu casa", address: "cra2.No2", kind:"comidas rapidas", valoration: 4, entrycost:500, town_id: 2,depart_id:3, user_id:2} }
    end
    assert_redirected_to '/places/1000'
  end

  test "should update place" do
    name = "la fonda updateada"
    post places_url, params: { places: { id: '', name: name , state: '', publicationdate: "", description: "", ubication: "", address: "", kind:"", valoration: '', entrycost:'', town_id: '',depart_id:'', user_id:''} }
  end
end
