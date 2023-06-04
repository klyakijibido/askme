class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:name, :nickname, :email, :password)

    user = User.create(user_params)
    session[:user_id] = user.id

    redirect_to root_path, notice: 'Вы успешно зарегистрировались!'
  end
end
