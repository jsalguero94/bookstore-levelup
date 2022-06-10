# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]
  before_action :set_authors_categories, only: %i[new edit create update]
  before_action :set_filters, only: :index

  def index
    @books = Book.filter(params.slice(:tag, :author)).order(:name).page params[:page]
  end

  def show
    @comment = BookComment.new
  end

  def new
    @book = Book.new
  end

  def edit; end

  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to book_path(@book), notice: t('.success') }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to book_path(@book), notice: t('.success') }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_path, notice: t('.success') }
    end
  end

  private

  def set_book
    @book = Book.active.find(params[:id])
    set_comments
  end

  def set_comments
    @comments = @book.book_comments.approved
  end

  def book_params
    params.require(:book).permit(:code, :name, :description, :price, :number_of_pages, :date_published, :active,
                                 :author_id, :category_id)
  end

  def set_authors_categories
    set_authors
    set_categories
  end

  def set_authors
    @authors = Author.all
  end

  def set_categories
    @categories = Category.all
  end

  def set_filters
    set_authors
    set_tags
  end

  def set_tags
    @tags = Tag.all
  end
end
