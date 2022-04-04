class ProjectMaster < ApplicationRecord
  has_many :tasks , dependent: :delete_all
  belongs_to :user
  has_many :members, dependent: :destroy
end
