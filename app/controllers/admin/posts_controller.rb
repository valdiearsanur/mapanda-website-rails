class Admin::PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
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

        # GET /admin/post/<id>/edit
        def edit
        end

        # POST /admin/post
        # POST /admin/post.json
        def create
            @post = Post.new(post_params)

            respond_to do |format|
            if @post.save
                format.html { redirect_to admin_posts_url, notice: 'Post was successfully created.' }
                format.json { render :show, status: :created, location: @post }
            else
                format.html { render :new }
                format.json { render json: @post.errors, status: :unprocessable_entity }
            end
            end
        end

        # PATCH/PUT /admin/games/1
        # PATCH/PUT /admin/games/1.json
        def update
            respond_to do |format|
            if @post.update(post_params)
                format.html { redirect_to @post, notice: 'Game was successfully updated.' }
                format.json { render :show, status: :ok, location: @post }
            else
                format.html { render :edit }
                format.json { render json: @post.errors, status: :unprocessable_entity }
            end
            end
        end

        # DELETE /admin/games/1
        # DELETE /admin/games/1.json
        def destroy
            @post.destroy
            respond_to do |format|
            format.html { redirect_to admin_posts_url, notice: 'Post was successfully destroyed.' }
            format.json { head :no_content }
            end
        end

    private
        def not_authenticated
            redirect_to login_path, alert: "Please login first"
        end

        # Use callbacks to share common setup or constraints between actions.
        def set_post
            @post = ::Post.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def post_params
        params.require(:post).permit(:title, :post)
        end
end