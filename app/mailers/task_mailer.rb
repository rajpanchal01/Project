class TaskMailer < ApplicationMailer
    default from: 'project management tool'

def new_task_email
    @task = params[:task]

    mail(to: User.find(@task.user_id).email, subject: "You have been assigned new task!")
  end
end