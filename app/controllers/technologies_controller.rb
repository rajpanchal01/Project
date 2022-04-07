class TechnologiesController < ApplicationController
    load_and_authorize_resource param_method: :return_param 

    def new 
    end

    def create
        @technology = Technology.new(return_param)
        if @technology.save!
            redirect_to technologies_path
        end    
    end

    def destroy
        @technology = Technology.find(params[:id])
        if @technology.delete
            redirect_to technologies_path
        end
    end

    private
        def return_param
            params.require(:technology).permit(:tname,:ttype)
        end
end
