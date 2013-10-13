class UsersController < ApplicationController
  before_filter :verify_is_admin, only: [:index, :destroy]
  before_filter :authenticate_user!

	def index
		@users = User.all.page(params[:page]).per_page(20).order("email ASC")
	end

	def show 
    @user = User.find(params[:id])
    @user_galleries = UserGallery.all :conditions => ['user_id = ?', @user]
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

  protected

  protected

    def devise_parameter_sanitizer
      if resource_class == User
        User::ParameterSanitizer.new(User, :user, params)
      else
        super # Use the default one
      end
    end
end
