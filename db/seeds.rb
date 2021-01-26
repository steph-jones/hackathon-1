10.times do 
  Trip.create(
    name: Faker::Name.name,
    description: Faker::String.random,
    start_date: Faker::Date.forward(23),
    end_date: Faker::Date.forward(23),
    user_id: 1,
  )
end

10.times do 
Location.create(
  name: Faker::Name.name,
  duration: Faker::Number.decimal_part(2),
  trip_id: 1,
)
end

10.times do 
Address.create(
  name: Faker::Address.street_name,
  street_address: Faker::Address.street_address,
  city: Faker::Address.city_suffix,
  state: Faker::Address.state,
  zipcode: Faker::Address.zip,
  location_id: 1,
)
end