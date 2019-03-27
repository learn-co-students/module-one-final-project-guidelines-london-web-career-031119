class List < ApplicationRecord
  belongs_to :user, autosave: true
  belongs_to :todo, autosave: true

end
