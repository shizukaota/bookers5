class BooksController < ApplicationController
  before_action :authenticate_user!, except:[:top, :about]
  before_action :correct_user, only: [:edit, :update]
  def top
      @books = Book.all
  end

  def about
  end

	def show
    @bookn = Book.find(params[:id])
    @book = Book.new
  end

  def index
      @books = Book.all
      @book = Book.new
  end

	def edit
		@book = Book.find(params[:id])
     if
      current_user != @book.user
      redirect_to root_books_
     end
     if
     flash[:notice] = " successfully."
     end
  end


	def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        if @book.save
          flash[:notice] = "successfully."
           redirect_to book_path(@book.id)
       else
        @books = Book.all
        render :index
      end
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
    flash[:notice] = "successfully."
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path

  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def ensure_correct_user
     @book= Book.find_by(id:params[:id])
     if @book.user_id != current_user.id
     flash[:notice] = "権限がありませんerror"
     redirect_to("/books/index")
   end
  end

private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

  def correct_user
    @book =  Book.find(params[:id])
    if current_user != @book.user
       redirect_to books_path
    end
  end
end


