class Assignment < ApplicationRecord
  belongs_to :exercise
  belongs_to :routine

  validates :note, length: { minimum: 6 }
  validates :exercise_id, uniqueness: { scope: :routine_id }
end
