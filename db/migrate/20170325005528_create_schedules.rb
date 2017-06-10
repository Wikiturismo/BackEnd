class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.time :mondayopen
      t.time :mondayclose
      t.time :tuesdayopen
      t.time :tuesdayclose
      t.time :wednesdayopen
      t.time :wednesdayclose
      t.time :thursdayopen
      t.time :thursdayclose
      t.time :fridayopen
      t.time :fridayclose
      t.time :saturdayopen
      t.time :saturdayclose
      t.time :sundayopen
      t.time :sundayclose
      t.references :place, foreign_key: true

      t.timestamps
    end
  end
end
