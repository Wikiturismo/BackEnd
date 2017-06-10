require 'test_helper'

class SchedulesControllerTest < ActionDispatch::IntegrationTest
  test 'should destroy schedule' do
    assert_difference('Schedule.count', -1) do
        delete '/schedules/1'
    end
  end

  test 'should not destroy schedule' do
    assert_difference('Schedule.count', 0) do
        delete '/schedules/150'
    end
  end

  test "should create schedule" do
    assert_difference('Schedule.count') do
      post schedules_url, params: { schedules: { id: 1000, mondayopen: "2000-01-01T13:38:41.000Z" , mondayclose: "2000-01-01T13:38:41.000Z", tuesdayopen: "2000-01-01T13:38:41.000Z", tuesdayclose: "2000-01-01T13:38:41.000Z", wednesdayopen: "2000-01-01T13:38:41.000Z", wednesdayclose: "2000-01-01T13:38:41.000Z", thursdayopen:"2000-01-01T13:38:41.000Z", thursdayclose: "2000-01-01T13:38:41.000Z", fridayopen:"2000-01-01T13:38:41.000Z", fridayclose: "2000-01-01T13:38:41.000Z",
        saturdayopen: "2000-01-01T13:38:41.000Z" , saturdayclose:"2000-01-01T13:38:41.000Z" , sundayopen: "2000-01-01T13:38:41.000Z" ,sundayclose: "2000-01-01T13:38:41.000Z", place_id:2} }
    end
    assert_redirected_to '/schedules/1000'
  end

  test "should update schedule" do
    name = '12:00'
    post schedules_url, params: { schedules: { id: '', mondayopen: name , mondayclose: "", tuesdayopen: "", tuesdayclose: "", wednesdayopen: "", wednesdayclose: "", thursdayopen:"", thursdayclose: "", fridayopen:"", fridayclose: "", saturdayopen: "" , saturdayclose:"" ,
      sundayopen: "" , sundayclose: "", place_id:""} }
  end
end
