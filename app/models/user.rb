# frozen_string_literal: true

class User < ApplicationRecord
  acts_as_paranoid
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :assign_default_role
  has_many :project_masters ,dependent: :nullify
  has_many :tasks ,dependent: :nullify
  validate :must_have_a_role, on: :update

  private
  def must_have_a_role
    unless roles.any?
      errors.add(:roles, "must have at least 1 role")
    end
  end
  
  def assign_default_role
    add_role(:employee) if roles.blank?
  end
end
