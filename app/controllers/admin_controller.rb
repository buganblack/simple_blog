class AdminController < ApplicationController
  before_filter :authentication_required!, only: ["blogs"]

  def index
    if session[:current_user]
      redirect_to blogs_admin_index_path
    else
      @admin_user = AdminUser.new
    end
  end

  def create
    admin_user_params = params.require(:admin_user)
    @admin_user = AdminUser.new
    .tap { |su| su.username = admin_user_params[:username] }
    .tap { |su| su.password = admin_user_params[:password] }
    if @admin_user.login_valid?
      session[:current_user] = true
      redirect_to blogs_admin_index_path
    else
      @admin_user.password = nil
      flash[:notice] = 'Sorry, wrong credentils'
      render "index"
    end
  end

  def blogs
    @blogs = Blog.all.recent
  end

  def logout
    reset_session
    redirect_to  admin_index_path
  end
end
