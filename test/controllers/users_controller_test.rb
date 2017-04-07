require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should create users" do
    assert_difference('User.count') do
      post users_url, params: { users: { id: 1000, name: "Juan" , kind: "admin", mail: "jumcorredorro@gmail.com", ubication: "calle26 bogota", registdate: "2017-03-20 00:00:00"} }
    end
    assert_redirected_to '/users/1000'
  end

  test "should update user" do
    name = "Manuel"
    post users_url, params: { users: { id: '', name: name , kind: "", mail: "", ubication: "", registdate: ""} }
  end
end
