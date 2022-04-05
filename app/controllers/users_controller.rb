class UsersController < ApplicationController
    def editrole
        @user = User.with_deleted.find(params[:id])
    end
      
    def update
        @user = User.with_deleted.find(params[:id])
        if !@user.deleted_at.nil?
          @user.restore
          redirect_to home_path, notice: "User was successfully restored."
        end

        if @user.update(user_params)
          redirect_to home_path, notice: "User was successfully updated."
        else
          render :editrole, status: :unprocessable_entity
        end
    end
    
    def destroy
        @user = User.find(params[:id])
        if @user.update(deleted_at: Time.current)
          redirect_to home_path, notice: "User was successfully deleted."
        else
          render :editrole, status: :unprocessable_entity
        end
      end

    def show
        render :index   
     end

    private
    def user_params
        params.require(:user).permit(:username, :email ,{role_ids: []})
    end

    

   
end
