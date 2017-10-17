class AdminsController < ApplicationController
  def index
    if session[:current_user]
      redirect_to "/admin_blogs"
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
      redirect_to "/admin_blogs"
    else
      @admin_user.password = nil
      flash[:notice] = 'Sorry, wrong credentils'
      render "index"
    end
  end

  def logout
    reset_session
    redirect_to  "/admins"
  end
end
