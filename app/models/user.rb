class User < ApplicationRecord
    has_many :teams, dependent: :destroy
end
