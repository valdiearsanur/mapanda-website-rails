class Admin::SessionsController < ApplicationController
  layout 'admin_login'

  def new
    @title = "Sign In";
  end

  def create
    if user = Admin::User.authenticate(params[:session][:email], params[:session][:password])
      session[:admin_user_id] = user.id
      redirect_to root_path, :notice => t('sessions.successful_login')
    else
      flash.now[:alert] = t('sessions.invalid_login')
      render :action => 'new'
    end
  end

  def destroy
    reset_session
    redirect_to root_path, :notice => t('sessions.logout_success')
  end
end
