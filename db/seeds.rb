# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Country.create(name: "france")
#Country.create(name: "italy")
  
#City.create(name: "paris", country_id: Country.find_by(name: "france").id)
#City.create(name: "nice", country_id: Country.find_by(name: "france").id)
#City.create(name: "roma", country_id: Country.find_by(name: "italy").id)
#City.create(name: "venezia", country_id: Country.find_by(name: "italy").id)
AttendanceRate.create(name: 'EA1', rate: 1)
AttendanceRate.create(name: 'A1', rate: 1)
AttendanceRate.create(name: 'NA1', rate: 1)
AttendanceRate.create(name: 'A13', rate: 1.3)
AttendanceRate.create(name: 'NA0', rate: 0)
AttendanceRate.create(name: 'E0', rate: 0)
AttendanceRate.create(name: 'ENA0', rate: 0)
AttendanceRate.create(name: 'ENA1', rate: 1)
