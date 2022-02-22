class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.new
    @book_new = Book.find(params[:id])
    @user = current_user

  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
  end

  def create
    @book = Book.new
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :new
    end

  end


private

  def books_params
    params.require(:books).permit(:title, :body, :user_id)
  end

end
