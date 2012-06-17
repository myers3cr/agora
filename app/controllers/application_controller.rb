class ApplicationController < ActionController::Base
	protect_from_forgery
	before_filter :authorize
	helper_method :current_user, :current_user_type

	private

	def authorize
		unless User.find_by_id(session[:user_id])
			redirect_to login_url, notice: "Please log in"
		end
	end

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

  def current_user_type
    current_user.org.org_type.name.downcase
  end

end
