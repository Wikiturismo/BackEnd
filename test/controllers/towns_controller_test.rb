require 'test_helper'

class TownsControllerTest < ActionDispatch::IntegrationTest
  test 'should destroy town' do
    assert_difference('Town.count', -1) do
        delete '/towns/10'
    end
  end

  test 'should not destroy town' do
    assert_difference('Town.count', 0) do
        delete '/towns/150'
    end
  end

  test "should create town" do
    assert_difference('Town.count') do
      post towns_url, params: { towns: { id: 1000, name: "Bogota" , weather: "templado", avertemper: 20, altitude: 2500, demonym: "Bogotano", airport: true, transpterminal:true, valoration: 4, depart_id:2} }
    end
    assert_redirected_to '/towns/1000'
  end

  test "should update town" do
    name = "Medellin"
    post towns_url, params: { towns: { id: '', name: name , weather: "", avertemper: '', altitude: '', demonym: "", airport: '', transpterminal:'', valoration: '', depart_id:''} }
  end
end
