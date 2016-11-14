class UsersController < ApplicationController
  def signup 
    @user=User.new    
  end

  def show
    @user = User.find(params[:id])
  end
    def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  def create
    @user=User.new(user_params)
    if @user.save
      flash[:success]='register successfully!'
      redirect_to @user
    else
      render 'signup'
    end
  end
  def destroy
    
  end

   def edit
    @user = User.find(params[:id])
   end
   private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end 
end
  