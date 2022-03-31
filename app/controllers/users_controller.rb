class UsersController < ApplicationController
    def editrole
        @user = User.find(params[:id])
    end
      
      def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          redirect_to dashboard_path, notice: "User was successfully updated."
        else
          render :editrole, status: :unprocessable_entity
        end
      end
    
    private
    def user_params
        params.require(:user).permit(:username, :email ,{role_ids: []})
    end

    def show
       render :index   
    end
end
