class UsersController < ApplicationController
  before_filter :verify_is_admin, only: [:index, :destroy]
  before_filter :current_user, only: [:show]

	def index
		@users = User.all.page(params[:page]).per_page(20).order("email ASC")
	end

	def show 
    @user = User.find(params[:id])
    if current_user == @user || current_user.admin?
      @user_galleries = UserGallery.all :conditions => ['user_id = ?', @user]
    else
      redirect_to users_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "#{@user.first_name} #{@user.last_name} removed."
    redirect_to users_path
  end

  private
    def user_params
     
    end

  # Before filter(s)

    def verify_is_admin
      (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
    end
end
