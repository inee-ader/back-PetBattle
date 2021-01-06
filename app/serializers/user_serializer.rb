class UserSerializer < ActiveModel::Serializer
    attributes :name, :id
    has_many :teams
    has_many :pets
end