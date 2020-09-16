class UsersController < ApplicationController

  def index
    @user = User.new
    @users = User.page(params[:id]).reverse_order
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_paramas)
    redirect_to user_path(@user.id)
  end

  private
  def user_paramas
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
