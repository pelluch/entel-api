# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)




plan_types = PlanType.create([
	{
		name: "Planes Full Multimedia",
		plans_attributes: [
			{ 
				name: "1.5 GB 350 Min.",
				price: 25990,
				internet_price: 23391,
				minutes: 350,
				megabytes: 1500
			},
			{
				name: "2GB 450 Min.",
				price: 29990,
				internet_price: 26991,
				minutes: 450,
				megabytes: 2000
			},
			{
				name: "3.5GB Min. Ilimitados*",
				price: 39990,
				megabytes: 3500,
				unlimited_minutes: true
			}
		]
	}, 
	{
		name: "Planes Multimedia Cuenta Controlada",
		plans_attributes: [
			{ 
				name: "Multimedia CC 400MB 110 Min.",
				price: 13990,
				internet_price: 12591,
				minutes: 110,
				megabytes: 400
			},
			{
				name: "Multimedia CC 600MB 155 Min.",
				price: 16990,
				internet_price: 15291,
				minutes: 155,
				megabytes: 600
			},
			{
				name: "Multimedia CC 1GB  224 Min.",
				price: 20990,
				internet_price: 18891
			}
		]
	},
	{
		name: "Planes Voz"
	},
	{
		name: "Mi Primer Plan"
	},
	{
		name: "Planes Multimedia Simple"
	},
	{
		name: "Tarifas Prepago"
	},
])

u1 = User.create rut: "17.085.953-7", phone_number: "56291329", 
	password: "12345678", first_name: "Pablo", last_name: "Lluch"

u2 = User.create rut: "11.111.111-1", phone_number: "99999999", 
password: "12345678", first_name: "Juan", last_name: "Pérez"

u1.plan = Plan.first
u1.save

u2.plan = Plan.second
u2.save

15.times do |i|
	day = Date.today - (14 - i).days
	DailyTraffic.create user: u1,
	day: day, 
	seconds: (rand*3600).round,
	messages: (rand*10).round,
	megabytes: (rand*80).round
end

25.times do |i|
	day = Date.today - (24 - i).days
	DailyTraffic.create user: u2,
	day: day, 
	seconds: (rand*3600).round,
	messages: (rand*10).round,
	megabytes: (rand*80).round
end
