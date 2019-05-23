class BooksController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user, only: [:edit, :update]


	def index
		@books = Book.all
		@newbook = Book.new
	end


	def create
		@books = Book.all
		@newbook = Book.new(book_params)
		@newbook.user_id = current_user.id
		if @newbook.save
		   redirect_to book_path(@newbook.id), notice: "You have creatad book successfully"
		else
			render :index
		end
	end

	def show
		@newbook = Book.new
		@books = Book.all
		@book = Book.find(params[:id])
		@user = @book.user
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			redirect_to book_path(@book), notice: "You have updated book successfully"
		else
			render :edit
		end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	private

	def book_params
		params.require(:book).permit(:title, :body)
	end

	def correct_user
    @user = Book.find(params[:id]).user
    redirect_to(books_path) unless @user == current_user
  end

end
