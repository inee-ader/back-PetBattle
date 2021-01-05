class User < ApplicationRecord
    has_secure_password
    has_many :teams, dependent: :destroy
    has_many :pets, dependent: :destroy
end
