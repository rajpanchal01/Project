# frozen_string_literal: true

class HomeController < ApplicationController 
  before_action :authenticate_user!

  def homepage
      @users = User.with_deleted.all
      # @task = Task.all.find_by_user_id(current_user.id)
      @task = Task.where(user_id: current_user.id).order('due_date')
      @clients = Client.with_deleted.all
      @manager = Role.find_by_name('manager').users
      @team = Role.find_by_name('employee').users
      @project = ProjectMaster.with_deleted.all

    end

    def destroy
    end
  
 
end
