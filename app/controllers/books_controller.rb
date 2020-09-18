class BooksController < ApplicationController

  def top
  end

  def about
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.page(params[:page]).reverse_order
      @user = current_user
      render :index
    end
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.page(params[:page]).reverse_order
  end

  def show
    @book = Book.new
    @book2 = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    book = Book.find(params[:id])
    if @book.user_id == current_user.id
      render :edit
    else
      @user = current_user
      redirect_to user_path(@user)
    end
  end

  def update
    @book = Book.new
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(book)
    else
      @book = Book.find(params[:id])
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path
  end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end