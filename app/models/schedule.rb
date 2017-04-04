class Schedule < ApplicationRecord
  belongs_to :place

  validates :place_id, presence: {message: "Campo obligatorio"}

  def self.load_schedules(page = 1, per_page = 10)
      includes(place:[:commentplaces,:imageplaces])
      .paginate(:page => page, :per_page => per_page)
  end

  def self.schedules_by_id(id)
      includes(place:[:commentplaces,:imageplaces])
     .find_by_id(id)
  end

  def self.schedules_by_monday(mondayopen,mondayclose,page = 1, per_page = 10)
    load_schedules(page,per_page)
    .where("schedules.mondayopen <= ? AND schedules.mondayclose >= ?", mondayopen,mondayclose)
  end

  def self.schedules_by_tuesday(tuesdayopen,tuesdayclose,page = 1, per_page = 10)
    load_schedules(page,per_page)
    .where("schedules.tuesdayopen <= ? AND schedules.tuesdayclose >= ?", tuesdayopen,tuesdayclose)
  end

  def self.schedules_by_wednesday(wednesdayopen,wednesdayclose,page = 1, per_page = 10)
    load_schedules(page,per_page)
    .where("schedules.wednesdayopen <= ? AND schedules.wednesdayclose >= ?", wednesdayopen,wednesdayclose)
  end

  def self.schedules_by_thursday(thursdayopen,thursdayclose,page = 1, per_page = 10)
    load_schedules(page,per_page)
    .where("schedules.thursdayopen <= ? AND schedules.thursdayclose >= ?", thursdayopen,thursdayclose)
  end

  def self.schedules_by_friday(fridayopen,fridayclose,page = 1, per_page = 10)
    load_schedules(page,per_page)
    .where("schedules.fridayopen <= ? AND schedules.fridayclose >= ?", fridayopen,fridayclose)
  end

  def self.schedules_by_saturday(saturdayopen,saturdayclose,page = 1, per_page = 10)
    load_schedules(page,per_page)
    .where("schedules.saturdayopen <= ? AND schedules.saturdayclose >= ?", saturdayopen,saturdayclose)
  end

  def self.schedules_by_saturday(sundayopen,sundayclose,page = 1, per_page = 10)
    load_schedules(page,per_page)
    .where("schedules.sundayopen <= ? AND schedules.sundayclose >= ?", sundayopen,sundayclose)
  end

  def self.schedules_by_place(name,page = 1, per_page = 10)
      joins(:place).select("schedules.*, places.id,schedules.id")
          .where("lower(places.name) = ? AND schedules.place_id=places.id", name.downcase)
              .paginate(:page => page,:per_page => per_page)
  end


end
