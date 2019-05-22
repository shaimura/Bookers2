class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]


  def correct_user
    redirect_to root_url
  end

  def show
  	@user = User.find(params[:id])
  	@books = @user.books.all
  end


  def index
    @users = User.all
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  private

  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
