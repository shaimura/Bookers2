class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@books = @user.books.all
  end

  def index
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  end

  private

  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image_id)
  end
end
