class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]
  before_action :get_authors_categories, only: %i[ new edit create update] 
  before_action :get_filters, only: :index

  # GET /books or /books.json
  def index
    @books = Book.filter(params.slice(:tag, :author)).order(:name).page params[:page]
  end

  # GET /books/1 or /books/1.json
  def show
    @comment = BookComment.new
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to book_path(@book), notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to book_path(@book), notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_path, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.active.find(params[:id])
      get_comments
    end

    def get_comments
      @comments = @book.book_comments.approved
    end

    # Only allow a list of trusted parameters through.
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
