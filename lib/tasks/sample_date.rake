namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
  make_users
  make_relationships
end
def make_users

    admin = User.create!(name: "Brabeeba Wang",
                         email: "mwang-14@peddie.org",
                         password: "1123581321",
                         password_confirmation: "1123581321",
                         admin: true)
  30.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@peddie.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
  end
end
def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..30]
  followers      = users[3..20]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end
end