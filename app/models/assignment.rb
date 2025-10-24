class Assignment < ApplicationRecord
  belongs_to :exercise
  belongs_to :routine

  validates :exercise_id, uniqueness: { scope: :routine_id }
end
