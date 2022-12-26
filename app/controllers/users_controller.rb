class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @book = Book.new
    @users = User.all
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @books = Book.all
    @book = Book.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
    else
      render :edit
    end
  end


  def edit
    @user = User.find(params[:id])
    # 他人のeditpageいけないようにする
    if @user != current_user
      redirect_to user_path(current_user.id)
    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end


