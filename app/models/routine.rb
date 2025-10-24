class Routine < ApplicationRecord
  has_many :assignments, dependent: :destroy
  has_many :exercises, through: :assignments

  has_one_attached :photo

  validates :name, presence: true, uniqueness: true
end
