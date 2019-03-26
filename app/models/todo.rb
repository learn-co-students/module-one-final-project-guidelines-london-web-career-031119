class Todo < ApplicationRecord
  has_many :list
  has_many :user, through: :list

  validates :task, presence: true

end
