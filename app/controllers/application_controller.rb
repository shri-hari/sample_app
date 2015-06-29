# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  include SessionsHelper
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password

	def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(:page => params[:page])
    render 'show_follow'
  end

	def followers
		@title = "Followers"
		@user = User.find(params[:id])
		@users = @user.followers.paginate(:page => params[:page]) 
    render 'show_follow'
	end
 	
  before_filter :set_cache_buster

	def set_cache_buster
   	response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
   	response.headers["Pragma"] = "no-cache"
   	response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
	end

end
