class ProjectMaster < ApplicationRecord
  has_many :tasks
  belongs_to :user
  has_many :members, dependent: :destroy
end
