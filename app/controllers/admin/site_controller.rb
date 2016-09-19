class Admin::SiteController < ApplicationController
    layout 'admin'

    # GET /admin/login
    def login
        @admin_adminlogin = Admin::AdminLogin.new
    end

    # POST /admin/login_attemp
    def login_attemp
        @admin_adminlogin = Admin::AdminLogin.new(admin_game_params)
        respond_to do |format|

        end

    end


    def index
        @admin_adminlogin = Admin::AdminLogin.new
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_admin_game
            @admin_adminlogin = Admin::AdminLogin.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def admin_game_params
            params.require(:admin_adminlogin).permit(:email, :password)
        end
end