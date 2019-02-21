class BooksController < ApplicationController
	def show
		@book = Post.find(params[:id])
	end

	def index
		@books = Book.all
	end

	def new
		@book = Book.new
	end

	def edit
		@book = Book.find(params[:id])
	end

	def create
        # ストロングパラメーターを使用
        post = book.new(book_params)
        # DBへ保存する
        post.save
        # トップ画面へリダイレクト
        redirect_to book_path(book.id)
    end
    def update
    	book= Book.find(params[:id])
        book.update(book_params)
        redirect_to book_path(book.id)
    end

    private

    def post_params
    	params.require(:post).permit(:title, :body)
    end
end



