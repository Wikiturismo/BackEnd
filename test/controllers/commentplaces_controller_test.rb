require 'test_helper'

class CommentplacesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test 'should destroy commentplace' do
    assert_difference('Commentplace.count', -1) do
        delete '/commentplaces/1'
    end
  end
  test 'should not destroy commentplace' do
    assert_difference('Commentplace.count', 0) do
        delete '/commentplaces/150'
    end
  end
  test "should create commentplace" do
    assert_difference('Commentplace.count') do
      post commentplaces_url, params: { commenttowns: { id: 1000, state: true , content:"Comenatario de la ciudad", publicationdate: "2017-03-24 00:00:00", town_id: 2, place_id: 3, user_id:4,depart_id:3} }
    end
    assert_redirected_to '/commentplaces/1000'
  end
end
