class Exercise < ApplicationRecord
  has_many :assignments, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
