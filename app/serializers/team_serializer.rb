class TeamSerializer < ActiveModel::Serializer
    attributes :id, :name, :user
    has_many :pet_teams
    has_many :pets
end