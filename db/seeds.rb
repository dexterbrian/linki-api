puts "🌱 Seeding houses..."

# Seed your database here
7.times do |i|

    # Seeding users
    user = User.create(
        username: Faker::Internet.username,
        password: '123456'
    )

    # Seeding links
    3.times do |i|
        link = Link.create(
            user_id: user.id,
            title: Faker::Book.title,
            url: Faker::Internet.url
        )
    end
end

puts "✅ Done seeding!"
