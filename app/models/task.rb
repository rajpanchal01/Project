class Task < ApplicationRecord
  has_many :issues
  acts_as_paranoid
  belongs_to :project_master
  validates :status, inclusion: {in: ['not-started','in-Progress','complete'] }
  STATUS_OPTIONS = [['Not started','not-started'],['In Progress','in-Progress'],['Complete','complete']]
end
