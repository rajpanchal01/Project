class TasksController < ApplicationController
  before_action :set_project_master
  before_action :set_task, only: [:show, :edit, :update, :destroy,:update_status]
  @users=User.all

  # GET project_masters/1/tasks
  def index
    @tasks = @project_master.tasks
  end

  # GET project_masters/1/tasks/1
  def show
  end

  # GET project_masters/1/tasks/new
  def new
    @task = @project_master.tasks.build
  end

  # GET project_masters/1/tasks/1/edit
  def edit
  end

  # POST project_masters/1/tasks
  def create
    @task = @project_master.tasks.build(task_params)

    if @task.save
      TaskMailer.with(task: @task).new_task_email.deliver_later
      # redirect_to([@task.project_master, @task], notice: 'Task was successfully created.')
      redirect_to(@task.project_master)
    else
      render action: 'new'
    end
  end
  
  def update_status
    if params[:status].present? && Task::STATUS_OPTIONS.collect {|ind| ind[1]}.include?(params[:status])
      @task.update(status: params[:status])
      redirect_to home_path, notice: 'status changed!'
    else
      redirect_to home_path, alert: 'stop hacking!'
    end
  end
  # PUT project_masters/1/tasks/1
  def update
    if @task.deleted_at.nil?
        if current_user.id == @task.project_master.user_id
          if @task.update(task_params)
            redirect_to(@task.project_master)
            # redirect_to(@task.project_master, notice: 'Task was successfully updated.')
          else
            render action: 'edit'
          end
        else @task.update(task_params)
          redirect_to root_path
        end
    else
      @task.restore
      redirect_to(@task.project_master)
    end
  end

  # DELETE project_masters/1/tasks/1
  def destroy
    @task.destroy

    redirect_to @project_master
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_master
      @project_master = ProjectMaster.with_deleted.find(params[:project_master_id])
    end

    def set_task
      @task = @project_master.tasks.with_deleted.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:name, :description, :status, :project_master_id, :user_id,:due_date ,:completed_date)
    end
end
