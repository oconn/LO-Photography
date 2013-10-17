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
    @post = Post.friendly.find(params[:id])
    Visit.track(@post, request.remote_ip)
  end

  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag]).page(params[:page]).per_page(3).order('created_at DESC')
    else  
      @posts = Post.search(params[:search], params[:page]).per_page(3).order('created_at DESC')
    end 
    @newest = Post.order('created_at DESC').limit(5)
    @popular = Post.joins(:visit).order('total_visits DESC').limit(5)
  end

  def edit
    @post = Post.friendly.find(params[:id])
  end

  def update
    @post = Post.friendly.find(params[:id])
 
    if @post.update(params[:post].permit(:title, 
                                         :text, 
                                         :cover_image, 
                                         :description,
                                         :tag_list))
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.friendly.find(params[:id])
    @post.destroy
    flash[:notice] = "Post removed."
    redirect_to posts_path
  end

	private
	  def post_params
	  	params.require(:post).permit(:title, 
                                   :text, 
                                   :cover_image, 
                                   :description,
                                   :tag_list)
	  end

	  # Before filter(s)

    def verify_is_admin
      (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
    end
end
