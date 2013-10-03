class CommentsController < ApplicationController
  before_filter :verify_is_admin, only: [:destroy]
  before_filter :authenticate_user!, only: [:create]
  
	def create
    @post = Post.friendly.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.friendly.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
    def comment_params
	  	params.require(:comment).permit(:body)
	  end

  # Before filter(s)

    def verify_is_admin
      (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
    end
end
