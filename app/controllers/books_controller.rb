class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]
  before_action :get_authors_categories, only: %i[ new edit create update] 
  before_action :get_filters, only: :index

  def index
    @books = Book.filter(params.slice(:tag, :author)).order(:name).page params[:page]
  end

  def show
    @comment = BookComment.new
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to book_path(@book), notice: "Book was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to book_path(@book), notice: "Book was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_path, notice: "Book was successfully destroyed." }
    end
  end

  private

  def set_book
    @book = Book.active.find(params[:id])
    get_comments
  end

  def get_comments
    @comments = @book.book_comments.approved
  end

  def book_params
    params.require(:book).permit(:code, :name, :description, :price, :number_of_pages, :date_published, :active, :author_id, :category_id)
  end
  
  def get_authors_categories
    get_authors
    get_categories
  end

  def get_authors
    @authors = Author.all
  end

  def get_categories
    @categories = Category.all
  end
  
  def get_filters
    get_authors
    get_tags
  end

  def get_tags
    @tags = Tag.all
  end
end
