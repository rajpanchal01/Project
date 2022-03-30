# frozen_string_literal: true

class HomeController < ApplicationController 
  before_action :authenticate_user!

  def homepage
      @users = User.all
  end

  def dashboard
    @users = User.order(created_at: :desc)
  end
end
