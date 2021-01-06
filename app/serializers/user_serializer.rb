class UserSerializer < ActiveModel::Serializer
    attributes :name, :id, :bio, :alias, :gif_url
    has_many :teams
    has_many :pets
end