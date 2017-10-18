class BlogsController < ApplicationController
  before_action :authentication_required!

  def index
    @blogs = Blog.all.recent.first(5)
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to "/admin_blogs", notice: "Successfully Created"
    else
      render :new
    end
  end

  def archive
    @blogs = Blog.all
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :contents, :eye_catch)
  end
end
