# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Generating 10 Todotask"
10.times do |i|
  Todotask.create(name: ["寫程式", "約會", "打電動", "讀書", "面試", "工作"].sample,
                  content: "不能空白啦",
                  start_time: Time.now,
                  end_time: Time.now.yesterday,
                  status: ["upcoming", "processing", "solved"].sample,
                  prioirty: ['low', 'basic', 'high'].sample)
end
puts "Done!" 