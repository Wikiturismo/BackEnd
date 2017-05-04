departments =["Amazonas","Antioquia","Arauca","Atlantico","Bolivar",
  "Boyaca","Caldas","Caqueta","Casanare","Cauca","Cesar",
  "Choco","Cordoba","Cundinamarca","Guainia","Guaviare",
  "Huila","La Guajira","Magdalena","Meta","Nariño","Norte de Santander",
  "Putumayo", "Quindio", "Risaralda","San Andres y Providencia","Santander",
  "Sucre","Tolima", "Valle del Cauca", "Vaupes","Vichada"]
placenames = ["Reserva Natural Marasha","Edificio Coltejer","Parque Zoologico Matecaña","Museo del Caribe","Las Bovedas",
  "Puente de Boyaca","Recinto del Pensamiento","Parque Natural Chiribiquete","Parque Natural la Iguana","Parque Arqueológico de Tierradentro","Centro Histórico de Valledupar",
  "Catedral de Quibdó","Parque Ecológico de Montelíbano","Museo Nacional","Cerros de Mavecure","Parque Guaviare",
  "Desierto de la Tatacoa","Hotel Taroa","Parque Natural Tayrona","Monumento a Los Fundadores","Plaza del Carnaval","Parque Grancolombiano",
  "Monumento al Centenario","Parque del Café","Zoológico Matecaña","Johnny Cay","Cañón del Chicamocha",
  "Plaza de Majagual","Vereda Veraguas","Parque Poetas","Parque Vaupes","Parque Natural El Tuparro"]
capitals = ["Leticia","Medellin","Arauca","Barranquilla","Cartagena",
  "Tunja","Manizales","Florencia","Yopal","Popayan","Valledupar",
  "Quibdo","Monteria","Bogota","Puerto Inirida","San Jose del Guaviare",
  "Neiva","Riohacha","Santa Marta","Villavicencio","Pasto","Cucuta",
  "Mocoa","Armenia","Pereira","San Andres","Bucaramanga",
  "Sincelejo","Ibague","Cali","Mitu","Puerto Carreño"]
demonyms = ["Amazonicos","Antioquenos","Araucanos","Atlanticenses","Bolivarienses",
  "Boyacenses","Caldenses","Caquetenos","Casanarenos","Caucanos","Cesarences",
  "Chocoanos","Cordobeses","Cundinamarqueses","Guainarenses","Guaviarenses",
  "Huilenses","Guajiros","Magdalenenses","Metenses","Nariñenses","Nortesantandereanos",
  "Putumayenses","Quindianos","Risaraldenses","Sanandresanos","Santandereanos",
  "Sucrenos","Tolimenses","Vallecaucanos","Vaupenses","Vichadense"]
demotowns = ["Leticianos","Medellinenses","Araucanos","Barranquilleros","Cartageneros",
   "Tunjanos","Manizalenos","Florencianos","Yopalenos","Payaneses","Valduparenses",
   "Quibdosenos","Monterianos","Bogotanos","Iniridenses","Guaviarenses",
   "Opitas","Riohacheros","Samarios","Villavicenciunos","Pastuso","Cucutenos",
   "Mocoanos","Armenios","Pereiranos","Sanandresanos","Bumangueses",
   "Sincelejanos","Ibaguerenos","Caleños","Mituanos","Carrenenses"]
descrip = ["Hermoso lugar con buena atencion a los turistas, con comodidades que lo hacen sobresalir sobre los demas.",
   "Lugar alejado y tranquilo que merece la pena visitar, bueno, bonito y barato.",
   "Ejemplo de buena atencion y amabilidad para con la gente, imposible perderse el visitarlo, es mucho mas que un sitio para vacacionar, tu nuevo segundo hogar."]

Depart.destroy_all

32.times do |index|
  Depart.create!(id:index,
                name: departments[index],
                capital: capitals[index],
                demonym: demonyms[index])
end

p "Created #{Depart.count} departs"

Town.destroy_all

32.times do |index|
  Town.create!(id:index,
                name: capitals[index],
                weather: "Weather #{index}",
                avertemper: Faker::Number.between(-10, 50),
                altitude: Faker::Number.between(0, 5000),
                demonym: demotowns[index],
                airport: Faker::Number.between(0,1),
                transpterminal: Faker::Number.between(0,1),
                depart_id: index)
end

p "Created #{Town.count} towns"

User.destroy_all

100.times do |index|
  User.create!(id:index,
                name: "NameUser #{index}",
                password: "password#{index}",
                kind: "KindUser #{index}",
                mail: "mail#{index}@gmail.com",
                ubication: "UbicationUser #{index}")
end

p "Created #{User.count} users"

Place.destroy_all

32.times do |index|
  Place.create!(id:index,
                name: placenames[index],
                state: 1,
                description: descrip[Faker::Number.between(0, 2)],
                ubication: "UbicationPlace #{index}",
                address: "Address #{index}",
                kind: "Kind #{index}",
                valoration: Faker::Number.between(1, 5),
                entrycost: Faker::Number.between(100, 5000),
                town_id: index,
                depart_id: index,
                user_id: Faker::Number.between(41, 60))
end


32.times do |index|
  n=Place.places_by_id(index,nil)
  n.update_column(:state, Faker::Boolean.boolean)
  val=Place.places_by_id(index,nil).valoration
  if val==1.0
    n.update_column(:valone,1)
  elsif val==2.0
    n.update_column(:valtwo,1)
  elsif val==3.0
    n.update_column(:valthree,1)
  elsif val==4.0
    n.update_column(:valfour,1)
  elsif val==5.0
    n.update_column(:valfive,1)
  end
end

p "Created #{Place.count} places"

Commentplace.destroy_all

100.times do |index|
  Commentplace.create!(id:index,
                state: Faker::Number.between(0,1),
                content: "Content from comment Place #{index}",
                town_id: Faker::Number.between(0, 20),
                place_id: Faker::Number.between(0, 20),
                user_id: Faker::Number.between(0, 20),
                depart_id: Faker::Number.between(0, 31))
end

p "Created #{Commentplace.count} commentplaces"

Commenttown.destroy_all

100.times do |index|
  Commenttown.create!(id:index,
                state: Faker::Number.between(0,1),
                content: "Content from comment Town #{index}",
                town_id: Faker::Number.between(0, 20),
                user_id: Faker::Number.between(0, 20),
                depart_id: Faker::Number.between(0, 31))
end

p "Created #{Commenttown.count} commenttowns"

Schedule.destroy_all

100.times do |index|
  Schedule.create!(id:index,
                    mondayopen: Faker::Time.between(2.days.ago, Date.today, :morning),
                    mondayclose: Faker::Time.between(2.days.ago, Date.today, :evening),
                    tuesdayopen: Faker::Time.between(2.days.ago, Date.today, :morning),
                    tuesdayclose: Faker::Time.between(2.days.ago, Date.today, :evening),
                    wednesdayopen: Faker::Time.between(2.days.ago, Date.today, :morning),
                    wednesdayclose: Faker::Time.between(2.days.ago, Date.today, :evening),
                    thursdayopen: Faker::Time.between(2.days.ago, Date.today, :morning),
                    thursdayclose: Faker::Time.between(2.days.ago, Date.today, :evening),
                    fridayopen: Faker::Time.between(2.days.ago, Date.today, :morning),
                    fridayclose: Faker::Time.between(2.days.ago, Date.today, :evening),
                    saturdayopen: Faker::Time.between(2.days.ago, Date.today, :morning),
                    saturdayclose: Faker::Time.between(2.days.ago, Date.today, :evening),
                    sundayopen: Faker::Time.between(2.days.ago, Date.today, :morning),
                    sundayclose:Faker::Time.between(2.days.ago, Date.today, :evening),
                    place_id: Faker::Number.between(0, 20))
end

p "Created #{Schedule.count} schedules"
