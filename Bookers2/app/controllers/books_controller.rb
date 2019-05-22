class BooksController < ApplicationController
	before_action :authenticate_user!

	def index
		@books = Book.all
	end


	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
		   redirect_to book_path(@book.id)
		else
			redirect_to books_path , flash: {error: '入力エラー'}
		end
	end

	def show
		@book = Book.find(params[:id])
		@user = @book.user
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			redirect_to book_path(@book)
		else
			render :edit
		end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to user_path(@book.user)
	end

	private

	def book_params
		params.require(:book).permit(:title, :body)
	end

end
