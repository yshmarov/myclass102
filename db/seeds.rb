# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Country.create(name: "france")
#Country.create(name: "italy")
  
#City.create(name: "paris", country_id: Country.find_by(name: "france").id)
#City.create(name: "nice", country_id: Country.find_by(name: "france").id)
#City.create(name: "roma", country_id: Country.find_by(name: "italy").id)
#City.create(name: "venezia", country_id: Country.find_by(name: "italy").id)
Tenant.create(name: 'FLC London', plan: 'FREE', tenant_id: 1)

User.create!([
                 {email: "user0@example.com", password: "user0@example.com", password_confirmation: "user0@example.com"},
                 {email: "user1@example.com", password: "user1@example.com", password_confirmation: "user1@example.com"},
                 {email: "user2@example.com", password: "user2@example.com", password_confirmation: "user2@example.com"},
                 {email: "user3@example.com", password: "user3@example.com", password_confirmation: "user3@example.com"},
              ])

TenantUser.create(user_id: 1, tenant_id: 1)
TenantUser.create(user_id: 2, tenant_id: 1)
TenantUser.create(user_id: 3, tenant_id: 1)
TenantUser.create(user_id: 4, tenant_id: 1)

Member.create(first_name: 'Iryna', last_name: 'Admin', user_id: 1, tenant_id: 1)
Member.create(first_name: 'Yulia', last_name: 'Priymuk', user_id: 2, tenant_id: 1)
Member.create(first_name: 'Oksana', last_name: 'Kovda', user_id: 3, tenant_id: 1)
Member.create(first_name: 'Nadia', last_name: 'Osipchuk', user_id: 4, tenant_id: 1)


AttendanceRate.create(name: 'EA1', rate: 1, tenant_id: 1)
AttendanceRate.create(name: 'A1', rate: 1, tenant_id: 1)
AttendanceRate.create(name: 'NA1', rate: 1, tenant_id: 1)
AttendanceRate.create(name: 'A13', rate: 1.3, tenant_id: 1)
AttendanceRate.create(name: 'NA0', rate: 0, tenant_id: 1)
AttendanceRate.create(name: 'E0', rate: 0, tenant_id: 1)
AttendanceRate.create(name: 'ENA0', rate: 0, tenant_id: 1)
AttendanceRate.create(name: 'ENA1', rate: 1, tenant_id: 1)

Office.create(name: 'Kir', tenant_id: 1)
Office.create(name: 'Pyat', tenant_id: 1)
Office.create(name: 'Rok', tenant_id: 1)
Office.create(name: 'Shor', tenant_id: 1)
Office.create(name: 'Shev', tenant_id: 1)

Room.create(name: 'kir1', office_id: '1', tenant_id: 1)
Room.create(name: 'kir2', office_id: '1', tenant_id: 1)
Room.create(name: 'kir3', office_id: '1', tenant_id: 1)

Room.create(name: 'pyat1', office_id: '2', tenant_id: 1)
Room.create(name: 'pyat2', office_id: '2', tenant_id: 1)
Room.create(name: 'pyat3', office_id: '2', tenant_id: 1)
Room.create(name: 'pyat4', office_id: '2', tenant_id: 1)

Room.create(name: 'rok1', office_id: '3', tenant_id: 1)
Room.create(name: 'rok2', office_id: '3', tenant_id: 1)
Room.create(name: 'rok3', office_id: '3', tenant_id: 1)
Room.create(name: 'rok4', office_id: '3', tenant_id: 1)
Room.create(name: 'rok5', office_id: '3', tenant_id: 1)
Room.create(name: 'rok6', office_id: '3', tenant_id: 1)

Room.create(name: 'shor1', office_id: '4', tenant_id: 1)
Room.create(name: 'shor2', office_id: '4', tenant_id: 1)
Room.create(name: 'shor3', office_id: '4', tenant_id: 1)
Room.create(name: 'shor4', office_id: '4', tenant_id: 1)
Room.create(name: 'shor5', office_id: '4', tenant_id: 1)
Room.create(name: 'shor6', office_id: '4', tenant_id: 1)

Room.create(name: 'shev1', office_id: '5', tenant_id: 1)
Room.create(name: 'shev2', office_id: '5', tenant_id: 1)
Room.create(name: 'shev3', office_id: '5', tenant_id: 1)



#Client.create!([
#                 {first_name: 'BLANK', last_name: 'CLIENT', birthday: "22-12-1961", email: "demoguest@example.com", password: "1FGS21awfwWz", password_confirmation: "1FGS21awfwWz"},
#                 {first_name: 'Yaroslav', last_name: 'Shmarov', birthday: "22-12-1962", email: "guest1@example.com", password: "guest1@example.com", password_confirmation: "guest1@example.com"},
#                 {first_name: 'Oleksandra', last_name: 'Rudnytska', birthday: "22-12-1963", email: "guest2@example.com", password: "guest2@example.com", password_confirmation: "guest2@example.com"},
#                 {first_name: 'Dima', last_name: 'TheFriend', birthday: "22-12-1964", email: "guest3@example.com", password: "guest3@example.com", password_confirmation: "guest3@example.com"},
#              ])
