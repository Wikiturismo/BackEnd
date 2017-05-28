departments =["Amazonas","Antioquia","Arauca","Atlántico","Bolívar",
  "Boyacá","Caldas","Caquetá","Casanare","Cauca","Cesar",
  "Chocó","Córdoba","Cundinamarca","Guainía","Guaviare",
  "Huila","La Guajira","Magdalena","Meta","Nariño","Norte de Santander",
  "Putumayo", "Quindío", "Risaralda","San Andrés y Providencia","Santander",
  "Sucre","Tolima", "Valle del Cauca", "Vaupés","Vichada"]
placenames = ["Reserva Natural Marasha","Edificio Coltejer","Parque Zoológico Matecaña","Museo del Caribe","Las Bóvedas",
  "Puente de Boyacá","Recinto del Pensamiento","Parque Natural Chiribiquete","Parque Natural la Iguana","Parque Arqueológico de Tierradentro","Centro Histórico de Valledupar",
  "Catedral de Quibdó","Parque Ecológico de Montelíbano","Museo Nacional","Cerros de Mavecure","Parque Guaviare",
  "Desierto de la Tatacoa","Hotel Taroa","Parque Natural Tayrona","Monumento a Los Fundadores","Plaza del Carnaval","Parque Grancolombiano",
  "Monumento al Centenario","Parque del Café","Zoológico Matecaña","Johnny Cay","Cañón del Chicamocha",
  "Plaza de Majagual","Vereda Veraguas","Parque Poetas","Parque Caraná","Parque Natural El Tuparro"]
  placid = [1,1,1,2,2,3,3,4,4,4,5,5,6,6,7,8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15,16,16,17,17,18,18,18,19,19,20,20,21,21,22,23,24,24,
    25,25,26,27,27,28,28,29,29,30,30,31,31,32,32]
capitals = ["Leticia","Medellín","Arauca","Barranquilla","Cartagena",
  "Tunja","Manizales","Florencia","Yopal","Popayán","Valledupar",
  "Quibdó","Montería","Bogotá","Puerto Inírida","San José del Guaviare",
  "Neiva","Riohacha","Santa Marta","Villavicencio","Pasto","Cúcuta",
  "Mocoa","Armenia","Pereira","San Andrés","Bucaramanga",
  "Sincelejo","Ibagué","Cali","Mitú","Puerto Carreño"]
capstempers = [26.0, 21.6, 26.8, 27.8, 27.5,
  12.8, 16.4, 19.9, 26.3, 17.8, 27.9,
  26.6, 27.4, 13.5, 27.2, 28.1,
  27.1, 28.3, 28.3, 25.5, 13.8, 26.6,
  24.0, 19.4, 20.6, 27.0, 23.4,
  26.6, 21.1, 24.0, 25.9, 28.3]
capsalts = [96, 1495, 15, 18, 2,
  2822, 2200, 242, 2532, 1760, 168,
  43, 18, 2640, 95, 175,
  442, 5, 15, 467, 2527, 320,
  604, 1551, 1411, 0, 959,
  213, 1285, 1018, 183, 51]
demonyms = ["Amazónicos","Antioqueños","Araucanos","Atlanticenses","Bolivarenses",
  "Boyacenses","Caldenses","Caqueteños","Casanareños","Caucanos","Cesarenses",
  "Chocoanos","Cordobeses","Cundinamarqueses","Guainarenses","Guaviarenses",
  "Huilenses","Guajiros","Magdalenenses","Metenses","Nariñenses","Nortesantandereanos",
  "Putumayenses","Quindianos","Risaraldenses","Sanandresanos","Santandereanos",
  "Sucreños","Tolimenses","Vallecaucanos","Vaupenses","Vichadenses"]
demotowns = ["Leticianos","Medellinenses","Araucanos","Barranquilleros","Cartageneros",
   "Tunjanos","Manizaleños","Florencianos","Yopaleños","Payaneses","Valduparenses",
   "Quibdoseños","Monterianos","Bogotanos","Iniridenses","Guaviarenses",
   "Opitas","Riohacheros","Samarios","Villavicenciunos","Pastusos","Cucuteños",
   "Mocoanos","Armenios","Pereiranos","Sanandresanos","Bumangueses",
   "Sincelejanos","Ibaguereños","Caleños","Mituanos","Carreñenses"]
descrip = ["Hermoso lugar con buena atención a los turistas, con comodidades que lo hacen sobresalir sobre los demás.",
   "Lugar alejado y tranquilo que merece la pena visitar, bueno, bonito y barato.",
   "Ejemplo de buena atención y amabilidad para con la gente, imposible perderse el visitarlo, es mucho mas que un sitio para vacacionar, tu nuevo segundo hogar."]

Depart.destroy_all

32.times do |index|
  Depart.create!(id:index+1,
                name: departments[index],
                capital: capitals[index],
                demonym: demonyms[index])
end

p "Created #{Depart.count} departs"

Town.destroy_all

32.times do |index|
  Town.create!(id:index+1,
                name: capitals[index],
                weather: "Weather #{index+1}",
                avertemper: capstempers[index],
                altitude: capsalts[index],
                demonym: demotowns[index],
                airport: Faker::Number.between(0,1),
                transpterminal: Faker::Number.between(0,1),
                depart_id: index+1)
end

32.times do |index|
  n = Town.towns_by_id(index+1,nil)
  if n.avertemper<15.0
    n.update_column(:weather,"Frío")
  elsif n.avertemper<25.0
    n.update_column(:weather,"Templado")
  elsif
    n.update_column(:weather,"Cálido")
  end
end

p "Created #{Town.count} towns"

User.destroy_all

30.times do |index|
  User.create!(id:index+1,
                name: Faker::StarWars.unique.character,
                kind: "KindUser #{index+1}",
                password: "password#{index+1}",
                email: "mail#{index+1}@gmail.com",
                ubication: "UbicationUser #{index+1}")
end

30.times do |index|
  n = User.users_by_id(index+1,nil)
  valor = Faker::Number.between(1, 3)
  if valor==1.0
    n.update_column(:kind,"usuario")
  elsif valor==2.0
    n.update_column(:kind,"administrador")
  elsif valor==3.0
    n.update_column(:kind,"dueño")
  end
end

p "Created #{User.count} users"

Place.destroy_all

32.times do |index|
  Place.create!(id:index+1,
                name: placenames[index],
                state: Faker::Number.between(0,1),
                description: descrip[Faker::Number.between(0, 2)],
                ubication: "UbicationPlace #{index}",
                address: "Address #{index}",
                kind: "Kind #{index}",
                valoration: 0,
                valone: Faker::Number.between(1, 30),
                valtwo: Faker::Number.between(1, 30),
                valthree: Faker::Number.between(1, 30),
                valfour: Faker::Number.between(1, 30),
                valfive: Faker::Number.between(1, 30),
                entrycost: Faker::Number.between(100, 5000),
                town_id: index+1,
                depart_id: index+1,
                user_id: Faker::Number.between(1, 30))
end

32.times do |index|
  n=Place.places_by_id(index+1,nil)
  val=((n.valone*1+n.valtwo*2+n.valthree*3+n.valfour*4+n.valfive*5).to_f/(n.valone+n.valtwo+n.valthree+n.valfour+n.valfive)).to_d.round(2, :truncate).to_f
  n.update_column(:valoration,val)
end

p "Created #{Place.count} places"

Commentplace.destroy_all

100.times do |index|
  Commentplace.create!(id:index+1,
                state: Faker::Number.between(0,1),
                content: "Content from comment Place #{index}",
                town_id: Faker::Number.between(1, 32),
                place_id: Faker::Number.between(1, 32),
                user_id: Faker::Number.between(1, 30),
                depart_id: Faker::Number.between(1, 32))
end

p "Created #{Commentplace.count} commentplaces"

Valoration.destroy_all

100.times do |index|
  Valoration.create!(id:index+1,
                val: Faker::Number.between(1, 5),
                place_id: Faker::Number.between(1, 32),
                user_id: Faker::Number.between(1, 30))
end

p "Created #{Valoration.count} valorations"


Commenttown.destroy_all

100.times do |index|
  Commenttown.create!(id:index+1,
                state: Faker::Number.between(0,1),
                content: "Content from comment Town #{index}",
                town_id: Faker::Number.between(1, 32),
                user_id: Faker::Number.between(1, 30),
                depart_id: Faker::Number.between(1, 32))
end

p "Created #{Commenttown.count} commenttowns"

Schedule.destroy_all

100.times do |index|
  Schedule.create!(id:index+1,
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
                    place_id: Faker::Number.between(1, 32))
end

p "Created #{Schedule.count} schedules"

Imageplace.destroy_all

63.times do |index|
  Imageplace.create!(id: index+1,
                    place_id: placid[index],
                    image: nil)
end

63.times do |index|
  n=Imageplace.imageplaces_by_id(index+1)
  n.update_column(:image , "image.jpg")
end

p "Created #{Imageplace.count} imageplaces"


Imagedepart.destroy_all

32.times do |index|
  Imagedepart.create!(id: index+1,
                    depart_id: index+1,
                    image: nil)
end

32.times do |index|
  n=Imagedepart.imagedeparts_by_id(index+1)
  n.update_column(:image , "image.jpg")
end

p "Created #{Imagedepart.count} imagedeparts"


Imageuser.destroy_all

30.times do |index|
  Imageuser.create!(id: index+1,
                    user_id: index+1,
                    image: nil)
end

30.times do |index|
  n=Imageuser.imageusers_by_id(index+1)
  n.update_column(:image , "image.jpg")
end

p "Created #{Imageuser.count} imageusers"

Imagetown.destroy_all

32.times do |index|
  Imagetown.create!(id: index*2+1,
                    town_id: index+1,
                    image: nil)
end

32.times do |index|
  Imagetown.create!(id: index*2+2,
                    town_id: index+1,
                    image: nil)
end

64.times do |index|
  n=Imagetown.imagetowns_by_id(index+1)
  n.update_column(:image , "image.jpg")
end

p "Created #{Imagetown.count} imagetowns"
