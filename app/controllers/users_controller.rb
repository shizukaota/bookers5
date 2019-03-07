class UsersController < ApplicationController
before_action :authenticate_user!
    def index
	    @users = User.all
	    @bookn = Book.new
    end

	def show
		@user = User.find(params[:id])
    	@bookn = Book.new
    	@books = @user.books

    end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:notice] = " successfully."
			redirect_to user_path(@user.id)
		else
			render :edit

		end
	end

	def edit
		@user = User.find(params[:id])
	end

private

	def user_params
		params.require(:user).permit(:name, :profile_image, :introduction)
	end


end







