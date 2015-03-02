# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ride = Ride.new(origin: "Delhi, New Delhi, India", origin_lat: 28.6139391, origin_long: 77.20902120000005, destination: "Hyderabad, Telangana, India", destination_lat: 17.385044, destination_long: 78.486671, departure_date: Date.today, departure_time: Time.now+96000, number_of_seats: 3, number_of_seats_occupied:1, initiator_id:1)
ride.save
ride.ridings.create(user_id: 1)

ride = Ride.new(origin: "Pitampura, New Delhi, Delhi, India",
            origin_lat: 28.69899839999999,
            origin_long: 77.13841739999998,
            destination: "Shalimar Bagh, New Delhi, Delhi, India",
            destination_lat: 28.7164134,
            destination_long: 77.15458460000002,
            departure_date: Date.today+1,
            departure_time: Time.now+96000,
            number_of_seats: 3,
            number_of_seats_occupied:1,
            initiator_id:1)
ride.save
ride.ridings.create(user_id: 1)

ride = Ride.new(origin: "Pitampura, New Delhi, Delhi, India",
            origin_lat: 28.69899839999999,
            origin_long: 77.13841739999998,
            destination: "Gurgaon, Haryana, India",
            destination_lat: 28.4594965,
            destination_long: 77.02663830000006,
            departure_date: Date.today+1,
            departure_time: Time.now+96000,
            number_of_seats: 3,
            number_of_seats_occupied:1,
            initiator_id:1)
ride.save
ride.ridings.create(user_id: 1)

ride = Ride.new(origin: "Pitampura, New Delhi, Delhi, India",
            origin_lat: 28.69899839999999,
            origin_long: 77.13841739999998,
            destination: "Gurgaon, Haryana, India",
            destination_lat: 28.4594965,
            destination_long: 77.02663830000006,
            departure_date: Date.today,
            departure_time: Time.now,
            number_of_seats: 3,
            number_of_seats_occupied:1,
            initiator_id:1)
ride.save
ride.ridings.create(user_id: 1)


ride = Ride.new(origin: "Gachibowli, Hyderabad, Telangana, India",
            origin_lat: 17.4400802,
            origin_long: 78.34891679999998,
            destination: "Jubilee Hills, Hyderabad, Telangana, India",
            destination_lat: 17.4325235,
            destination_long: 78.40701519999993,
            departure_date: Date.today,
            departure_time: Time.now+96000,
            number_of_seats: 3,
            number_of_seats_occupied:1,
            initiator_id:1)
ride.save
ride.ridings.create(user_id: 1)

ride = Ride.new(origin: "Gachibowli, Hyderabad, Telangana, India",
            origin_lat: 17.4400802,
            origin_long: 78.34891679999998,
            destination: "Punjab, India",
            destination_lat: 31.1471305,
            destination_long: 75.34121789999995,
            departure_date: Date.today,
            departure_time: Time.now+96000,
            number_of_seats: 3,
            number_of_seats_occupied:1,
            initiator_id:1)
ride.save
ride.ridings.create(user_id: 1)

ride = Ride.new(origin: "Gachibowli, Hyderabad, Telangana, India",
            origin_lat: 17.4400802,
            origin_long: 78.34891679999998,
            destination: "Film Nagar, Hyderabad, Telangana, India",
            destination_lat: 17.4141797,
            destination_long: 78.41169000000002,
            departure_date: Date.today,
            departure_time: Time.now+96000,
            number_of_seats: 3,
            number_of_seats_occupied:1,
            initiator_id:1)
ride.save
ride.ridings.create(user_id: 1)

ride = Ride.new(origin: "Gachibowli, Hyderabad, Telangana, India",
            origin_lat: 17.4400802,
            origin_long: 78.34891679999998,
            destination: "Shamshabad, Hyderabad, Telangana 500409, India",
            destination_lat: 17.240263,
            destination_long: 78.42938500000002,
            departure_date: Date.today,
            departure_time: Time.now+96000,
            number_of_seats: 3,
            number_of_seats_occupied:1,
            initiator_id:1)
ride.save
ride.ridings.create(user_id: 1)

ride = Ride.new(origin: "Care Hospitals, Hyderabad, Telangana, India",
            origin_lat: 17.385768,
            origin_long: 78.47422000000006,
            destination: "Jubilee Hills, Hyderabad, Telangana, India",
            destination_lat: 17.4325235,
            destination_long: 78.40701519999993,
            departure_date: Date.today,
            departure_time: Time.now+96000,
            number_of_seats: 3,
            number_of_seats_occupied:1,
            initiator_id:1)
ride.save
ride.ridings.create(user_id: 1)

ride = Ride.new(origin: "Delhi, New Delhi, India",
            origin_lat: 28.6139391,
            origin_long: 77.20902120000005,
            destination: "Noida, Uttar Pradesh, India",
            destination_lat: 28.5355161,
            destination_long: 77.39102649999995,
            departure_date: Date.today,
            departure_time: Time.now+96000,
            number_of_seats: 3,
            number_of_seats_occupied:1,
            initiator_id:1)
ride.save
ride.ridings.create(user_id: 1)

ride = Ride.new(origin: "Delhi, New Delhi, India",
            origin_lat: 28.6139391,
            origin_long: 77.20902120000005,
            destination: "Faridabad, Haryana, India",
            destination_lat: 28.4089123,
            destination_long: 77.31778940000004,
            departure_date: Date.today,
            departure_time: Time.now+96000,
            number_of_seats: 3,
            number_of_seats_occupied:1,
            initiator_id:1)
ride.save
ride.ridings.create(user_id: 1)

ride = Ride.new(origin: "Kangra, Himachal Pradesh, India",
            origin_lat: 32.0998031,
            origin_long: 76.2691006,
            destination: "Sudarshan Nagar, Pimpri-Chinchwad, Maharashtra, India",
            destination_lat: 18.5977841,
            destination_long: 73.81433649999997,
            departure_date: Date.today,
            departure_time: Time.now+96000,
            number_of_seats: 3,
            number_of_seats_occupied:1,
            initiator_id:1)
ride.save
ride.ridings.create(user_id: 1)





ride = Ride.new(origin: "HITEC City, Hyderabad, Telangana, India",
            origin_lat: 17.445824,
            origin_long: 78.37739540000007,
            destination: "Rajiv Gandhi International Airport, Hyderabad, Telangana, India",
            destination_lat: 17.240263,
            destination_long: 78.42938500000002,
            departure_date: Date.today+3,
            departure_time: Time.now+86400*3,
            number_of_seats: 3,
            number_of_seats_occupied:1,
            initiator_id:1)
ride.save
ride.ridings.create(user_id: 1)

ride = Ride.new(origin: "HITEC City, Hyderabad, Telangana, India",
            origin_lat: 17.445824,
            origin_long: 78.37739540000007,
            destination: "Rajiv Gandhi International Airport, Hyderabad, Telangana, India",
            destination_lat: 17.240263,
            destination_long: 78.42938500000002,
            departure_date: Date.today+3,
            departure_time: Time.now+86400*3-3600,
            number_of_seats: 3,
            number_of_seats_occupied:1,
            initiator_id:1)
ride.save
ride.ridings.create(user_id: 1)
ride = Ride.new(origin: "HITEC City, Hyderabad, Telangana, India",
            origin_lat: 17.445824,
            origin_long: 78.37739540000007,
            destination: "Rajiv Gandhi International Airport, Hyderabad, Telangana, India",
            destination_lat: 17.240263,
            destination_long: 78.42938500000002,
            departure_date: Date.today+3,
            departure_time: Time.now+86400*3-3600*2,
            number_of_seats: 3,
            number_of_seats_occupied:1,
            initiator_id:1)
ride.save
ride.ridings.create(user_id: 1)


ride = Ride.new(origin: "HITEC City, Hyderabad, Telangana, India",
            origin_lat: 17.445824,
            origin_long: 78.37739540000007,
            destination: "Rajiv Gandhi International Airport, Hyderabad, Telangana, India",
            destination_lat: 17.240263,
            destination_long: 78.42938500000002,
            departure_date: Date.today+3,
            departure_time: Time.now+86400*3+3600*0.5,
            number_of_seats: 3,
            number_of_seats_occupied:1,
            initiator_id:1)
ride.save
ride.ridings.create(user_id: 1)

ride = Ride.new(origin: "HITEC City, Hyderabad, Telangana, India",
            origin_lat: 17.445824,
            origin_long: 78.37739540000007,
            destination: "Rajiv Gandhi International Airport, Hyderabad, Telangana, India",
            destination_lat: 17.240263,
            destination_long: 78.42938500000002,
            departure_date: Date.today+3,
            departure_time: Time.now+86400*3+3600,
            number_of_seats: 3,
            number_of_seats_occupied:1,
            initiator_id:1)
ride.save
ride.ridings.create(user_id: 1)
ride = Ride.new(origin: "HITEC City, Hyderabad, Telangana, India",
            origin_lat: 17.445824,
            origin_long: 78.37739540000007,
            destination: "Rajiv Gandhi International Airport, Hyderabad, Telangana, India",
            destination_lat: 17.240263,
            destination_long: 78.42938500000002,
            departure_date: Date.today+3,
            departure_time: Time.now+86400*3+3600*2,
            number_of_seats: 3,
            number_of_seats_occupied:1,
            initiator_id:1)
ride.save
ride.ridings.create(user_id: 1)