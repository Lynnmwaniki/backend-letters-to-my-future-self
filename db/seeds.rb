User.destroy_all
PrivateLetter.destroy_all
PublicLetter.destroy_all

5.times do
    User.create(name: Faker::Name.name, email: Faker::Address.full_address, phone_number: Faker::PhoneNumber.cell_phone, password: Faker::String.random )

end

5.times do 
    PrivateLetter.create(text: Faker::Lorem.paragraph , date: Faker::Date.in_date_period, user_id: 6)
end

5.times do
    PublicLetter.create(text: Faker::Lorem.paragraph, date: Faker::Date.in_date_period, views: Faker::Number.number, likes: Faker::Number.number, user_id: 7)
end

puts " Done!!"