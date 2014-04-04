namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
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
end