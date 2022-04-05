class MembersController < ApplicationController
    def new
        @project = ProjectMaster.find(params[:id])
    end

    def create
        @project = ProjectMaster.find(params[:id])
        @member = Member.new(return_param)
        @member.update(project_master_id: @project.id)
        if @member.save!
            redirect_to members_path(@project.id)
        end
    end

    def destroy
        @member = Member.find(params[:id])
        @project = ProjectMaster.find(@member.project_master_id)
        if @member.delete
            redirect_to members_path(@project.id)
        end
    end

    private
        def return_param
            params.permit(:user_id)
        end
end
