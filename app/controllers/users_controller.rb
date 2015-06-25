class UsersController < ApplicationController
  	def new
  		@user = User.new
  		@title = "Sign up"
  	end

  	def show
      redirect_to home_path unless signed_in? 
  		@user = User.find(params[:id])
  		@title = @user.name
  	end

	def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end

end
