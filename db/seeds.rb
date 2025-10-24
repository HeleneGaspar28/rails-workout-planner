# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Exercise.destroy_all

Exercise.create!(
  name: "Push-Up",
  description: "Horizontal press using bodyweight from prone position.",
  category: "strength", equipment: "bodyweight", difficulty: "beginner"
)
Exercise.create!(
  name: "Goblet Squat",
  description: "Squat holding a weight at chest level.",
  category: "strength", equipment: "dumbbell", difficulty: "beginner"
)
Exercise.create!(
  name: "Deadlift",
  description: "Hip hinge to lift load from floor.",
  category: "strength", equipment: "barbell", difficulty: "intermediate"
)
Exercise.create!(
  name: "Plank",
  description: "Isometric core hold on forearms.",
  category: "mobility", equipment: "bodyweight", difficulty: "beginner"
)
Exercise.create!(
  name: "Jump Rope",
  description: "Rhythmic rope jumps for conditioning.",
  category: "cardio", equipment: "jump rope", difficulty: "beginner"
)

puts "Seeded #{Exercise.count} exercises"
