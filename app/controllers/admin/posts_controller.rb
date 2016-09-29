class Admin::PostsController < ApplicationController
    protect_from_forgery
    layout 'admin'

    protected
        # Returns the currently logged in admin or nil if there isn't one
        def current_admin
            return unless session[:admin_id]
            @current_admin ||= AdminLogin.find_by_id(session[:adminr_id]) 
        end


    public
        # GET /admin/post/index
        def index
            @posts = ::Post.all
        end

        # GET /admin/post/new
        def new
            @post = ::Post.new
        end

    private
        def not_authenticated
            redirect_to login_path, alert: "Please login first"
        end

end