class MembersController < ApplicationController
    def new
        @project = ProjectMaster.find(params[:id])
    end
end
