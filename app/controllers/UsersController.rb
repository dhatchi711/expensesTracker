class UsersController < ApplicationController  
    def index
        render json: User.all
    end
  
    def show
      @user = User.find(params[:id])
    end
  
    def create
        user = User.new(user_params)
        if user.save
          render json: user, status: :created
        else
          render json: user.errors, status: :unprocessable_entity
      end
      
    def edit
    end
  
    def update
      if @user.update_attributes(user_params)
        flash[:success] = "User updated"
    end
  
    def destroy
      User.find(params[:id]).destroy
      flash[:success] = "User deleted"
    end
    
    private
  
    def user_params
        params.require(:user).permit(:name, :balance)
    end  
  end
  