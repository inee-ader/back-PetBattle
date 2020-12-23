class PetTeam < ApplicationRecord
  belongs_to :pet
  belongs_to :team
end
