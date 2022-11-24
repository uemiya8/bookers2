class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.all
  end

  def edit
   @user = User.find(params[:id])
  end
  
  def index
   @user = current_user
   @users = User.all
   @book = Book.new
  end
  
  def update
   @user = User.find(params[:id])
   @user.update(user_params)
   flash[:notice] = "You have update user successfully"
   redirect_to user_path(@user.id)
  end
  
  
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
