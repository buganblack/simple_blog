class BlogsController < ApplicationController
  before_action :authentication_required!

  def index
  end

  def new
  end

  def create
    if Blog.create(blog_params)
      redirect_to "/admin_blogs", notice: "Successfully Created"
    else
      render :new
    end
  end

  def admin_blogs
    @blogs = Blog.all
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :contents, :eye_catch)
  end
end
