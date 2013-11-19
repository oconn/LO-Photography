class UserImagesController < ApplicationController
	before_filter :verify_is_admin, only: [:create, :destroy]

  def create  
  	if signed_in?
  		@user = User.find(params[:user_id])
  		@user_gallery = UserGallery.friendly.find(params[:user_gallery_id])
  		@image = @user_gallery.user_images.create(user_image_params)
      redirect_to [@user, @user_gallery]
  	else
  		@user_gallery = UserGallery.friendly.find(params[:user_gallery_id])
      redirect_to signin_url, notice: "Please sign in to add an image."
      session[:return_to] = user_user_gallery_path(@gallery)
  	end
  end

  def destroy
  	@user = User.find(params[:user_id])
  	@user_gallery = UserGallery.friendly.find(params[:user_gallery_id])
  	@image = @user_gallery.user_images.find(params[:id])
  	@image.destroy
  	flash[:notice] = "Image remove."
  	redirect_to [@user, @user_gallery]
  end

	private

    def user_image_params
    	params.require(:user_image).permit(:image) if params[:user_image]
    end

    # Before filter(s)

    def verify_is_admin
      (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
    end
end
