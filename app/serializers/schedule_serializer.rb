class ScheduleSerializer < ActiveModel::Serializer
  attributes :id, :mondayopen, :mondayclose, :tuesdayopen, :tuesdayclose, :wednesdayopen, :wednesdayclose, :thursdayopen, :thursdayclose, :fridayopen, :fridayclose, :saturdayopen, :saturdayclose

  #belongs_to :place
end
