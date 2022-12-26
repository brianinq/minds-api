puts "🌱 Seeding dummy data...."
admins = User.create!(
    username: "su",
    name: "Super Admin",
    password: "123",
    email: "su@example.com",
    age: "23",
    gender: "M",
    avatar: "https://avataaars.io/",
    is_counselor: false,
    is_admin: true 
)
specializations = %w(Psychiatrist Psychologist Divorce\ Therapist Child\ Thetapist Bhavioral\ Thetapist Addiction\ Therapist)
10.times do
    User.create!(
        username: Faker::Name.unique.first_name,
        name: Faker::Name.name,
        password: Faker::Alphanumeric.alphanumeric(number: 5),
        email: Faker::Internet.email,
        age: rand(18..50),
        gender: %W(M F).sample,
        avatar: "https://avataaars.io/",
        is_counselor: false,
        is_admin: false 
    )
end
users = User.all
5.times do
    user = User.create!(
        username: Faker::Name.unique.first_name,
        name: Faker::Name.name,
        password: Faker::Alphanumeric.alphanumeric(number: 5),
        email: Faker::Internet.email,
        age: rand(18..50),
        gender: %W(M F).sample,
        avatar: "https://avataaars.io/",
        is_counselor: true,
        is_admin: false 
    )
    profile = CounselorProfile.create!(
        user_id: user.id,
        specialization: specializations.sample,
        verified: true,
        bio: Faker::Lorem.paragraph_by_chars(number: 200),
        experience: Faker::Lorem.paragraph_by_chars(number: 400)
    )
    profile.reviews.create!(
        user_id: users.sample.id,
        comment: Faker::Lorem.paragraph_by_chars(number: 200),
        approved: [true, false].sample
    )
end

therapists = CounselorProfile.all

15.times do
    therapists.sample.sessions.create!(
        time: Time.at(Time.now.to_i + 87000*rand(1..15)),
        topic: specializations.sample,
        title: Faker::Lorem.sentence,
        description: Faker::Lorem.paragraph_by_chars(number: 300),
        maximum: rand(2..10),
        location: ["Online", Faker::Address.full_address].sample
    )
end

3.times do
    users[0..4].sample.appointments.create!(
        counselor_profile_id: therapists.sample.id,
        time: Time.at(Time.now.to_i + 87000*rand(1..15)),
        topic: specializations.sample,
        title: Faker::Lorem.sentence,
        description: Faker::Lorem.paragraph_by_chars(number: 300),
        location: ["Online", Faker::Address.full_address].sample,
        approved: [true, false].sample
    )
end

puts "✔✔ Seeding done!"
