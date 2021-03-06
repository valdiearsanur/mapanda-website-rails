class Admin::BaseController < ApplicationController
    protect_from_forgery
    before_action :set_admin_login, only: [:show, :destroy]
    layout 'admin_login'

    protected
        # Returns the currently logged in admin or nil if there isn't one
        def current_admin
            return unless session[:admin_id]
            @current_admin ||= AdminLogin.find_by_id(session[:adminr_id]) 
        end


    public
        # GET /admin/login
        def login
            @admin = Admin::AdminLogin.new
        end

        # POST /admin/loginattemp
        def loginattemp
            @admin = Admin::AdminLogin.new(admin_login_params)

            admin = Admin::AdminLogin.find_by(email: params[:site][:email].downcase)
            if user && admin.authenticate(params[:site][:password])
                # Log the admin in and redirect to the admin's show page.
                render 'index'
            else
                # Create an error message.
                flash[:danger] = 'Invalid email/password combination'
                render 'login'
            end

        end

        # POST /admin/forgotpassword
        def forgotpassword
            @admin = Admin::AdminLogin.new(admin_login_params)

            admin = Admin::AdminLogin.find_by(email: params[:site][:email].downcase)
            if user && admin.authenticate(params[:site][:password])
                # Log the admin in and redirect to the admin's show page.
                render 'index'
            else
                # Create an error message.
                flash[:danger] = 'Invalid email/password combination'
                render 'login'
            end

        end

        def index
            @admin_adminlogin = Admin::AdminLogin.new
        end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_admin_login
            @admin_adminlogin = Admin::AdminLogin.find(params[:id])
        end

        def not_authenticated
            redirect_to login_path, alert: "Please login first"
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def admin_login_params
            params.require(:admin_login).permit(:email, :password)
        end

end