class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :first_name, :first_name_kana, :last_name, :last_name_kana, :birth_day).merge(user_id: current_user.id)
  end
end
