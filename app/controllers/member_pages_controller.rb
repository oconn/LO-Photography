class MemberPagesController < ApplicationController
	before_filter :authenticate_user!

	def toolkit
	end
end
