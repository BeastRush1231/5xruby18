FactoryBot.define do
  factory :todotask do
    user { User.first }
    name { Faker::Name.name }
    content { Faker::Movies::HarryPotter.quote }
  end
end