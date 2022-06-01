# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  include PublicActivity::Model
    tracked
  primary_abstract_class
end
