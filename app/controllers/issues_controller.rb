class IssuesController < ApplicationController
  before_action :set_task
  before_action :set_issue, only: [:show, :edit, :update, :destroy]

  # GET tasks/1/issues
  def index
    @issues = @task.issues
  end

  # GET tasks/1/issues/1
  def show
  end

  # GET tasks/1/issues/new
  def new
    @issue = @task.issues.build
  end

  # GET tasks/1/issues/1/edit
  def edit
  end

  # POST tasks/1/issues
  def create
    @issue = @task.issues.build(issue_params)

    if @issue.save
      redirect_to project_master_task_issues_path, notice: 'Issue was successfully created.'
    else
      render action: 'new'
    end
  end

  # PUT tasks/1/issues/1
  def update
    if @issue.update_attributes(issue_params)
      redirect_to([@issue.task, @issue], notice: 'Issue was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE tasks/1/issues/1
  def destroy
    @issue.destroy

    redirect_to task_issues_url(@task)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:task_id])
    end

    def set_issue
      @issue = @task.issues.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def issue_params
      params.require(:issue).permit(:question, :answer, :status)
    end
end
