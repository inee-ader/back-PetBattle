class Pet < ApplicationRecord
  belongs_to :user
  has_many :pet_teams, dependent: :destroy
  has_many :teams, through: :pet_teams
end
