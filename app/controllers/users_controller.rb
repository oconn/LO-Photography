class UsersController < ApplicationController
  before_filter :verify_is_admin, only: [:index]

	def index
		@users = User.all.page(params[:page]).per_page(20).order("email ASC")
	end

	def show 
    @user = User.find(params[:id])
  end

  private
    def user_params
     
    end

  # Before filter(s)

    def verify_is_admin
      (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
    end
end
