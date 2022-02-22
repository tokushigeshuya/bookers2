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
  end

  def update
  end

private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
