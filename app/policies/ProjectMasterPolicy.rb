class ProjectMasterPolicy < ApplicationPolicy
    attr_reader :user, :project_master
  
    def initialize(user, project_master)
      @user = user
      @project_master = project_master
    end
  
    def update?
      user.has_role? :admin or user.has_role? :manager
    end
    def show?
        project_master.user_id==user.id or user.has_role? :admin
    end
    def index?
        user.has_role? :admin or user.has_role? :manager
        
    end
    def create?
      user.has_role? :admin
    end
    def new?
      user.has_role? :admin
    end
  end