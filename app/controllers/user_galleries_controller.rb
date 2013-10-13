class UserGalleriesController < ApplicationController
	before_filter :verify_is_admin, only: [:new, :create, :edit, :update, :destroy, :index]

	def index
    if current_user.admin?
      @user_galleries = UserGallery.page(params[:page]).per_page(16).order('created_at DESC') 
    else
      redirect_to root_path, notice: "Please sign in."
      session[:return_to] = user_path(@user)
    end
	end

	def new
		@user_gallery = UserGallery.new
	end

	def create
    @user = User.find(params[:user_id])
    @user_gallery = @user.user_galleries.new(user_gallery_params)

    if @user_gallery.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def show 
    @user = User.find(params[:user_id])
    @user_gallery = UserGallery.friendly.find(params[:id])
  end

  def edit
    @user = User.find(params[:user_id])
    @user_gallery = @user.user_galleries.friendly.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @user_gallery = @user.user_galleries.friendly.find(params[:id])

    if @user_gallery.update(params[:user_gallery].permit(:name, 
                                                         :preview_image,
                                                         :description))
      flash[:notice] = "Gallery Updated."
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @user_gallery = UserGallery.friendly.find(params[:id])
    @user_gallery.destroy
    flash[:notice] = "Gallery removed."
    redirect_to @user
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
