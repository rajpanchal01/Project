class ProjectMasterMailer < ApplicationMailer
    default from: 'project management tool'

def new_project_master_email
    @project_master = params[:project_master]

    mail(to: User.find(@project_master.user_id).email, subject: "You are added to new project!")
  end
end