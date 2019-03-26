class User < ApplicationRecord
    has_many :list
    has_many :todo, through: :list

    validates :name, presence: true

    def get_todos

    end
end
