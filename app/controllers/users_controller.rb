class UsersController < ApplicationController

  def index
    @book = Book.new
    @user = current_user
    @users = User.page(params[:id]).reverse_order
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_paramas)
      flash[:notice] = "Profile was successfully updated."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def profile
  end

  private
  def user_paramas
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
