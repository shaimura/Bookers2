class UsersController < ApplicationController
  def show
  	@users = User.find(params[:id])
  	@books = @users.books.all
  end

  def index
    @users = User.all
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
    redirect_to users_path
  end

  private

  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image_id)
  end
end
