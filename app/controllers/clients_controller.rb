class ClientsController < ApplicationController
    def new
        @client = Client.new
    end
    def create
        @client = Client.new(client_params)
        respond_to do |format|
            if @client.save
                format.html { redirect_to home_path, notice: "Client was successfully created." }
            end
        end

    end

    def edit
        @client = Client.find(params[:id])
    end

    def update
        @client = Client.find(params[:id])
        if @client.update(client_params)
          redirect_to home_path, notice: "Client was successfully updated."
        else
          render :edit, status: :unprocessable_entity
        end
    end
    private
    def client_params
        params.require(:client).permit(:name, :email )
    end
  
end
