class UserSerializer < ActiveModel::Serializer
    attributes :name 
    has_many :teams
    has_many :pets
end