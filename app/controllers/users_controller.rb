class UsersController < ApplicationController
  	def new
  		@user = User.new
  		@title = "Sign up"
  	end

  	def show
  		@user = User.find(params[:id])
  		@title = @user.name
  	end

	def create
		@user = User.new(params[:user]) 
		if @user.save
        @title = "success"
        flash[:success] = "Welcome to the Sample App!"
      	redirect_to @user
		else
      		@title = "error"
	  		render 'new'
		end
	end

end
