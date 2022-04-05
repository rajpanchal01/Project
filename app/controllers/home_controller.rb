# frozen_string_literal: true

class HomeController < ApplicationController 
  before_action :authenticate_user!

  def homepage
      @users = User.all
      # @task = Task.all.find_by_user_id(current_user.id)
      @task = Task.where(user_id: current_user.id)
      @clients = Client.all
      @manager = Role.find_by_name('manager').users
      @team = Role.find_by_name('employee').users
      @project = ProjectMaster.all

    end

  # def dashboard
  #   @users = User.order(created_at: :desc)
  # end
 
end
