# frozen_string_literal: true

class BookCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book_comments, only: :create

  def show_commented_books
    @commented_books = current_user.commented_books.active.order(:name).page params[:page]
  end

  def create
    respond_to do |format|
      if @comment.save
        format.html do
          redirect_to book_path(@book), notice: t('.success')
        end
      else
        format.html { render 'books/show', status: :unprocessable_entity }
      end
    end
  end

  private

  def comment_params
    params.require(:book_comment).permit(:message).merge(params.permit(:book_id))
  end

  def set_book_comments
    @comment = current_user.book_comments.build comment_params
    @book = @comment.book
    @comments = @book.book_comments.approved
  end
end
