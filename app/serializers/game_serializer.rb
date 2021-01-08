class GameSerializer < ActiveModel::Serializer
    attributes :id, :exp, :gold, :win, :user, :team
    has_many :bosses
end
