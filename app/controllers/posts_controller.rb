class PostsController < ApplicationController
  before_filter :verify_is_admin, only: [:new, :create, :edit, :update, :destroy]
  
	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
    
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
	end

	def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all.page(params[:page]).per_page(4).order('created_at DESC')
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
 
    if @post.update(params[:post].permit(:title, :text, :cover_image, :description))
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Post removed."
    redirect_to posts_path
  end

	private
	  def post_params
	  	params.require(:post).permit(:title, :text, :cover_image, :description)
	  end

	  # Before filter(s)

    def verify_is_admin
      (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
    end
end
