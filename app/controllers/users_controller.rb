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
		@user.update(user_params)
		redirect_to user_path(@user.id)
	end

	def edit
		@user = User.find(params[:id])

        if @user.id != current_user.id

            flash[:notice] = " successfully."
            render :show


        else

            redirect_to user_path(current_user)
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :profile_image, :introduction)
	end

end








