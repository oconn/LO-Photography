class GalleriesController < ApplicationController
  before_filter :verify_is_admin, only: [:new, :create, :edit, :update, :destroy]
  
	def index
		@galleries = Gallery.all
	end

	def new
		@gallery = Gallery.new
	end

	def create
    @gallery = Gallery.new(gallery_params)
 
    if @gallery.save
    	flash[:notice] = "Gallery Created"
      redirect_to @gallery
    else
      render 'new'
    end
  end

  def show 
  	@gallery = Gallery.find(params[:id])
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
    @gallery = Gallery.find(params[:id])
 
    if @gallery.update(params[:gallery].permit(:name, 
      	                                       :preview_image,
                                               :description))
      flash[:notice] = "Gallery updated"
      redirect_to @gallery
    else
      render 'edit'
    end
  end
  
  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    flash[:notice] = "Gallery removed."
    redirect_to galleries_path
  end

  private

    def gallery_params
      params.require(:gallery).permit(:name, 
      	                              :preview_image,
                                      :description)
    end

    # Before filter(s)

    def verify_is_admin
      (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
    end

end
