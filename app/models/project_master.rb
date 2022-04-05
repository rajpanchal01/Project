class ProjectMaster < ApplicationRecord
  acts_as_paranoid
  has_many :tasks , dependent: :delete_all
  belongs_to :user
  has_many :members, dependent: :destroy
end
