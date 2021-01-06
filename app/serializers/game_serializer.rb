class GameSerializer < ActiveModel::Serializer
    attributes :id, :exp, :gold, :user, :team
    has_many :bosses
end
