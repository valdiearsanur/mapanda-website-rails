class Admin::SessionsController < ApplicationController
  def create
    if admin = AdminLogin.authenticate(params[:email], params[:password])
      session[:admin_id] = admin.id
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
