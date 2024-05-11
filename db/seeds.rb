# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create Screens

User.create!(
  email: 'admin@example.com',
  password: 'admin123',
  admin: true
)
Screen.create(name: 'Screen 1')
Screen.create(name: 'Screen 2')
Screen.create(name: 'Screen 3')
# Add more screens as needed

# Create Seats for each Screen
Screen.all.each do |screen|
  ('A'..'E').each do |row|
    (1..7).each do |number|
      screen.seats.create(number: "#{row}#{number}")
    end
  end
end
