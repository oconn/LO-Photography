class GalleryImagesController < ApplicationController
  before_filter :verify_is_admin, only: [:create, :destroy]

	def create
    if signed_in?
      @gallery = Gallery.friendly.find(params[:gallery_id])
      @image = @gallery.gallery_images.create(gallery_image_params)
      redirect_to gallery_path(@gallery)
    else
      @gallery = Gallery.friendly.find(params[:gallery_id])
      redirect_to signin_url, notice: "Please sign in to add an image."
      session[:return_to] = gallery_path(@gallery)
    end
  end

  def destroy
    @gallery = Gallery.friendly.find(params[:gallery_id])
    @image = @gallery.gallery_images.find(params[:id])
    @image.destroy
    flash[:notice] = "Image removed."
    redirect_to gallery_path(@gallery)
  end

  private

    def gallery_image_params
    	params.require(:gallery_image).permit(:image)
    end

    # Before filter(s)

    def verify_is_admin
      (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
    end
end
