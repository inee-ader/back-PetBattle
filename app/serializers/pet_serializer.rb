class PetSerializer < ActiveModel::Serializer
    attributes :id, :name, :pet_type, :abilities, :img_url, :hp, :level, :exp, :user
    has_many :pet_teams
    has_many :teams
end