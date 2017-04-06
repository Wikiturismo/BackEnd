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
end
