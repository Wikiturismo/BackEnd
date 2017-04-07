require 'test_helper'

class CommenttownsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test 'should destroy commenttown' do
    assert_difference('Commenttown.count', -1) do
        delete '/commenttowns/1'
    end
  end
  test 'should not destroy commenttown' do
    assert_difference('Commenttown.count', 0) do
        delete '/commenttowns/150'
    end
  end
    test "should create commenttown" do
      assert_difference('Commenttown.count') do
        post commenttowns_url, params: { commenttowns: { id: 1000, state: true , content:"Comenatario de la ciudad", publicationdate: "2017-03-24 00:00:00", town_id: 2, user_id:4,depart_id:3} }
      end
      assert_redirected_to '/commenttowns/1000'
    end
end
