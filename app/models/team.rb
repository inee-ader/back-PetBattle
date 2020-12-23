class Team < ApplicationRecord
  belongs_to :user
  has_many :pet_teams, dependent: :destroy
  has_many :pets, through: :pet_teams
  # validates :team, length:{is:3}
end
