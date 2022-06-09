class BookCommentsController < ApplicationController
  before_action :authenticate_user!

  def show_commented_books
    @commented_books = current_user.commented_books.active.order(:name).page params[:page]
  end

  def create
    @comment = current_user.book_comments.build comment_params
    @book = @comment.book
    @comments = @book.book_comments.approved

    respond_to do |format|
      if @comment.save
        format.html { redirect_to book_path(@book), notice: "Comment was successfully created. But is pending of approval" }
      else
        format.html { render "books/show", status: :unprocessable_entity}
      end
    end
  end

  private

  def comment_params
    params.require(:book_comment).permit(:message).merge(params.permit(:book_id))
  end
end
