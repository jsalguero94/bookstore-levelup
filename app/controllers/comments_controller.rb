class CommentsController < ApplicationController
  before_action :authenticate_user!


  # POST /comments or /comments.json
  def create
    @comment = Comment.new(comment_params)
    @book = Book.find(@comment.book_id)
    @comment.user_id = current_user.id
    @comments = Comment.all.where("book_id=#{@book.id} and approved=true")


    respond_to do |format|
      if @comment.save
        format.html { redirect_to book_path(@book), notice: "Comment was successfully created. But is pending of approval" }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render "books/show", status: :unprocessable_entity}
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        #render "books/show", status: :unprocessable_entity 
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:message, :approved, :book_id)
    end
end
