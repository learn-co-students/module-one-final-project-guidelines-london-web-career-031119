class User < ApplicationRecord
    has_many :list
    has_many :todos, through: :list

    validates :name, presence: true

end
