class UserGalleriesController < ApplicationController
	before_filter :verify_is_admin, only: [:new, :create, :edit, :update, :destroy]

	def index 
		@user_galleries = UserGallery.all
	end

	def new
		if signed_in?
		  @user = User.find(params[:user_id])
		else 
			redirect_to(root_url)
		end
	end

	def create
    if signed_in?
      @user = User.find(params[:user_id])
      @user_gallery = @user.user_galleries.create(user_gallery_params)
      redirect_to user_path(@user)
    else
      @user = User.find(params[:id])
      redirect_to signin_url, notice: "Please sign in to add a gallery."
      session[:return_to] = user_path(@user)
    end
  end

  def show 
    @user = User.find(params[:user_id])
    @user_gallery = UserGallery.find(params[:id])
  end


	private
    def user_gallery_params
      params.require(:user_gallery).permit(:name, 
      	                                   :preview_image,
      	                                   :description)
    end

  # Before filter(s)

    def verify_is_admin
      (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
    end
    
end
