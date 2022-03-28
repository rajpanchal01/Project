class UsersController < ApplicationController
    def editrole
        @user = User.find(params[:id])
    end
      
      def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          redirect_to users_url, notice: "User was successfully updated."
        else
          render :dashboard, status: :unprocessable_entity
        end
      end
    
    private
    def user_params
        params.require(:user).permit({role_ids: []})
    end

    def show
       render :index   
    end
end
