class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
    @books = Book.all
  end

  def show
    @user = current_user
    @book = Book.new
    @users = User.find(params[:id])
    @books = @users.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
