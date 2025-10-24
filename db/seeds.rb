# --- Clear old data (optional for dev) ---
Assignment.destroy_all
Routine.destroy_all
Exercise.destroy_all

# --- Exercises ---
Exercise.create!(
  [
    {
      name: "Push-Up",
      description: "Horizontal press using bodyweight from prone position.",
      category: "strength", equipment: "bodyweight", difficulty: "beginner"
    },
    {
      name: "Goblet Squat",
      description: "Squat holding a weight at chest level.",
      category: "strength", equipment: "dumbbell", difficulty: "beginner"
    },
    {
      name: "Deadlift",
      description: "Hip hinge to lift load from floor.",
      category: "strength", equipment: "barbell", difficulty: "intermediate"
    },
    {
      name: "Plank",
      description: "Isometric core hold on forearms.",
      category: "mobility", equipment: "bodyweight", difficulty: "beginner"
    },
    {
      name: "Jump Rope",
      description: "Rhythmic rope jumps for conditioning.",
      category: "cardio", equipment: "jump rope", difficulty: "beginner"
    }
  ]
)

puts "Seeded #{Exercise.count} exercises"

# --- Routines ---
routines = Routine.create!(
  [
    { name: "Full Body A" },
    { name: "Upper Body" },
    { name: "Leg Day" }
  ]
)

puts "Seeded #{Routine.count} routines"

# --- Attach photos (make sure these image files exist locally) ---
# Place 3 jpg or png files in app/assets/images/
full_body = Routine.find_by(name: "Full Body A")
upper_body = Routine.find_by(name: "Upper Body")
leg_day = Routine.find_by(name: "Leg Day")

full_body.photo.attach(
  io: File.open(Rails.root.join("app/assets/images/full_body.jpeg")),
  filename: "full_body.jpeg",
  content_type: "image/jpeg"
)

upper_body.photo.attach(
  io: File.open(Rails.root.join("app/assets/images/upper_body.jpeg")),
  filename: "upper_body.jpeg",
  content_type: "image/jpeg"
)

leg_day.photo.attach(
  io: File.open(Rails.root.join("app/assets/images/leg_day.jpeg")),
  filename: "leg_day.jpeg",
  content_type: "image/jpeg"
)

puts "Attached photos to routines"

# --- Assignments ---
pushup  = Exercise.find_by(name: "Push-Up")
squat   = Exercise.find_by(name: "Goblet Squat")
deadlift = Exercise.find_by(name: "Deadlift")
plank   = Exercise.find_by(name: "Plank")
jumprope = Exercise.find_by(name: "Jump Rope")

Assignment.create!(
  [
    { routine: full_body, exercise: pushup,  sets: 3, reps: 10, note: "Keep core tight" },
    { routine: full_body, exercise: squat,   sets: 3, reps: 12, note: "Chest up" },
    { routine: full_body, exercise: plank,   sets: 3, reps: 30, note: "Hold 30s each" },

    { routine: upper_body, exercise: pushup,  sets: 4, reps: 8, note: "Slow tempo" },
    { routine: upper_body, exercise: deadlift, sets: 4, reps: 6, note: "Engage lats" },

    { routine: leg_day, exercise: squat,   sets: 4, reps: 10, note: "Depth to parallel" },
    { routine: leg_day, exercise: jumprope, sets: 3, reps: 60, note: "60 jumps per set" }
  ]
)

puts "Seeded #{Assignment.count} assignments"
puts "✅ Seeding complete!"
