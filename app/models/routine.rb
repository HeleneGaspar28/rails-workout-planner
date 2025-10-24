class Routine < ApplicationRecord
  has_many :assignments, dependent: :destroy
  has_many :exercises, through: :assignments

  validates :name, presence: true, uniqueness: true
end
