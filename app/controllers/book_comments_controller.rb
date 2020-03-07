class BookCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    book = Book.find(params[:book_id])
    comment = book.book_comments.build(book_comment_params)
    comment.user_id = current_user.id
    comment.book_id = book.id
    if comment.save
      flash[:notice] = "Comment was sucucessfully"
      redirect_to book_path(book)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    @comment = @book.book_comments.find(params[:id])
    if @book_comment.user != current_user
      redirect_back(fallback_location: root_path)
    end
    @comment.destroy
    redirect_to book_path(@book)
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
