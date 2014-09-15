class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Thank you for signing up!!!!!!!"
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation).merge(:user_id => current_user.id)
  end
end
