class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def show
    @user = selected_user

    if @user
      render :show
    else
      flash[:errors] = ["No such User"]
      redirect_to new_user_url
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in_user!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ["Invalid inputs for user"]
      redirect_to bands_url
    end
  end



  private

  def selected_user
    User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password_digest, :password)
  end
end
