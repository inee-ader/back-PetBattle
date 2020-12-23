class Game < ApplicationRecord
  belongs_to :user
  belongs_to :team
  has_many :bosses
end
