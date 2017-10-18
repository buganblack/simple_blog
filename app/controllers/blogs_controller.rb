class BlogsController < ApplicationController
  before_action :authentication_required!

  BLOG_PER_PAGE = 5

  def index
    @blogs = Blog.all.recent.first(BLOG_PER_PAGE)
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

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
  end

  def archive
    @blogs = Blog.all.recent.page(params[:page]).per(BLOG_PER_PAGE)
    @total_page = @blogs.total_count / BLOG_PER_PAGE
  end

  def single_view
    @blog = Blog.find(params[:blog_id])
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :contents, :eye_catch)
  end
end
