class Member < ApplicationRecord
    acts_as_paranoid
    belongs_to :project_master
    belongs_to :user
end
