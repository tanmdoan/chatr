# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

[User, Message].each(&:destroy_all)

puts "Destroying previous seeds..."

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

puts "Resetting db primary keys..."

jon = User.create!(name: 'Jon Snow')
white_walker = User.create!(name: 'Ice King')

5.times do
  Message.create!(recipient: jon, sender: white_walker, body: 'Fresh messages: White Walker paging Jon')
end

5.times do
  Message.create!(recipient: white_walker, sender: jon, body: 'Fresh messages: Jon copy that')
end

100.times do
  Message.create!(recipient: white_walker, sender: jon, body: 'Stale messages: Jon paging White Walker', created_at: 50.days.ago)
end

puts "Finished seeding all messages..."

