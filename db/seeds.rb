Depart.destroy_all

100.times do |index|
  Depart.create!(id:index,
                name: "NameDepart #{index}",
                capital: "Capital #{index}",
                demonym: "DemonymDepart #{index}")
end

p "Created #{Depart.count} departs"

Town.destroy_all

100.times do |index|
  Town.create!(id:index,
                name: "NameTown #{index}",
                weather: "Weather #{index}",
                avertemper: index-50,
                altitude: index,
                demonym: "DemonymTown #{index}",
                airport: true,
                transpterminal: true,
                depart_id: Faker::Number.between(1, 20))
end

p "Created #{Town.count} towns"

User.destroy_all

100.times do |index|
  User.create!(id:index,
                name: "NameUser #{index}",
                kind: "KindUser #{index}",
                mail: "mail#{index}@gmail.com",
                ubication: "UbicationUser #{index}",
                registdate:  DateTime.now.to_date)
end

p "Created #{User.count} users"

Place.destroy_all

100.times do |index|
  Place.create!(id:index,
                name: "NamePlace #{index}",
                state: true,
                publicationdate:  DateTime.now.to_date,
                description: "Description from Place #{index}",
                ubication: "UbicationPlace #{index}",
                address: "Address #{index}",
                kind: "Kind #{index}",
                valoration: index%6,
                entrycost: index,
                town_id: Faker::Number.between(1, 20),
                depart_id: Faker::Number.between(21, 40),
                user_id: Faker::Number.between(41, 60))
end

p "Created #{Place.count} places"

Comment.destroy_all

100.times do |index|
  Comment.create!(id:index,
                state: true,
                content: "Content from comment #{index}",
                publicationdate:  DateTime.now.to_date,
                town_id: Faker::Number.between(1, 20),
                place_id: Faker::Number.between(20, 40),
                user_id: Faker::Number.between(41, 60),
                depart_id: Faker::Number.between(61, 80))
end

p "Created #{Comment.count} comments"

Schedule.destroy_all

100.times do |index|
  Schedule.create!(id:index,
                    mondayopen: Time.now.to_datetime,
                    mondayclose: Time.now.to_datetime.end_of_day,
                    tuesdayopen: Time.now.to_datetime,
                    tuesdayclose: Time.now.to_datetime.end_of_day,
                    wednesdayopen: Time.now.to_datetime,
                    wednesdayclose: Time.now.to_datetime.end_of_day,
                    thursdayopen: Time.now.to_datetime,
                    thursdayclose: Time.now.to_datetime.end_of_day,
                    fridayopen: Time.now.to_datetime,
                    fridayclose: Time.now.to_datetime.end_of_day,
                    saturdayopen: Time.now.to_datetime,
                    saturdayclose: Time.now.to_datetime.end_of_day,
                    sundayopen: Time.now.to_datetime,
                    sundayclose: Time.now.to_datetime.end_of_day,
                    place_id: Faker::Number.between(1, 20))
end

p "Created #{Schedule.count} schedules"

Image.destroy_all

100.times do |index|
  Image.create!(id:index,
                height: index+101,
                width: index+101,
                path: "Path #{index}",
                depart_id: Faker::Number.between(1, 20),
                town_id: Faker::Number.between(20, 40),
                place_id: Faker::Number.between(40, 60))
end

p "Created #{Image.count} images"
