class ProjectMastersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project_master, only: %i[ show edit update destroy ]

  # GET /project_masters or /project_masters.json
  def index
    if current_user.has_role? :admin
     @project_masters = ProjectMaster.all
    else
     @project_masters = current_user.project_masters
    end
  end

  # GET /project_masters/1 or /project_masters/1.json
  def show
    @task = @project_master.tasks.build
  end

  # GET /project_masters/new
  def new
    @users = User.order(created_at: :desc)
    @project_master = ProjectMaster.new
    @clients = Client.order(created_at: :desc)
  end

  # GET /project_masters/1/edit
  def edit
    @users = User.order(created_at: :desc)
  end

  # POST /project_masters or /project_masters.json
  def create
    @project_master = ProjectMaster.new(project_master_params)
    # @project_master = current_user.project_masters.build(project_master_params)

    respond_to do |format|
      if @project_master.save
        format.html { redirect_to project_master_url(@project_master), notice: "Project master was successfully created." }
        format.json { render :show, status: :created, location: @project_master }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_masters/1 or /project_masters/1.json
  def update
    respond_to do |format|

      if @project_master.update(project_master_params)
        format.html { redirect_to project_master_url(@project_master), notice: "Project master was successfully updated." }
        format.json { render :show, status: :ok, location: @project_master }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_masters/1 or /project_masters/1.json
  def destroy
    @project_master.destroy

    respond_to do |format|
      format.html { redirect_to project_masters_url, notice: "Project master was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_master
      @project_master = ProjectMaster.find(params[:id])
      @project = ProjectMaster.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_master_params
      params.require(:project_master).permit(:name, :description ,:user_id, :ptype ,:client_id,:client_requirements,:budget,:phase,:technology,:start_date,:end_date,:expected_duration)
    end
end
