class UsersController < ApplicationController
  def index
    @book = Book.new
    @users = User.all
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @books = Book.all
  end

  def update 
    current_user.update(user_params)
    redirect_to user_path(current_user.id) #user/showに飛ぶ
  end

  def edit
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
