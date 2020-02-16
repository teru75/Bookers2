class BooksController < ApplicationController
	before_action :authenticate_user!
def create
	@book = Book.new(book_params)
	@book.user_id = current_user.id
  if @book.save
  	flash[:notice] = "You have creatad book successfully."
	redirect_to book_path(@book)
	else
		@books = Book.all
		@user = current_user
		render :index
	end
end

def index
	@books = Book.all
	puts @books.to_json
	@book = Book.new
end

def show
	@find = Book.find(params[:id])
	@book = Book.new
end

def edit
	@book = Book.find(params[:id])
	if @book.user_id != current_user.id
		redirect_to books_path
	end
end

def update
	@book = Book.find(params[:id])
	if @book.update(book_params)
		flash[:notice] = "You have updated book successfully."
	redirect_to book_path(@book)
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
end
