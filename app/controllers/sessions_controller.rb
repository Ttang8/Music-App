class SessionsController < ApplicationController
  def create
    user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if user.nil?
      flash.now[:errors] = ["Incorrect username and/or password"]
      render :new
    else
      log_in_user!(user)
      redirect_to bands_url
    end
  end

  def destroy
    log_out!
    redirect_to new_session_url
  end

  def new
    render :new
  end
end
