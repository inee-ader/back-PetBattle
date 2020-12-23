class TeamSerializer < ActiveModel::Serializer
    attributes :id, :username, :first_name, :last_name
    has_many :pet_teams_items
    has_many :pets
end