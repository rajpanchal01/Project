class Member < ApplicationRecord
    belongs_to :project_master
    belongs_to :user
end
