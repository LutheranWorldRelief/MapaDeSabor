class Panel::BlogsController < Panel::ApplicationController
  before_action :set_blog, only: [:edit, :update, :destroy]

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    blog = Blog.new(blog_params)
    if blog.save
      redirect_to panel_blogs_path, notice: 'Registro creado'
    else
      render :new
      flash[:error] = 'Ocurrio un error'
    end
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to panel_blogs_path, notice: 'Registro actualizado'
    else
      render :edit
      flash[:error] = 'Ocurrio un error'
    end
  end

  def destroy
    if @blog.destroy
      redirect_to panel_blogs_path, notice: 'Registro eliminado'
    else
      redirect_to panel_blogs_path, notice: 'Ocurrio un error'
    end
  end

  private

    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:title, :body, :presentation, :autor, :status)
    end
end
