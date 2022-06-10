# frozen_string_literal: true

class AuthorsController < ApplicationController
  before_action :set_author, only: %i[show edit update destroy]
  before_action :books, only: :show

  def index
    @authors = Author.order(:name).page params[:page]
  end

  def show; end

  def new
    @author = Author.new
  end

  def edit; end

  def create
    @author = Author.new(author_params)

    respond_to do |format|
      if @author.save
        format.html { redirect_to author_path(@author), notice: t('.success') }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @author.update(author_params)
        format.html { redirect_to author_path(@author), notice: t('.success') }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @author.destroy

    respond_to do |format|
      format.html { redirect_to authors_path, notice: t('.success') }
    end
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:name)
  end

  def books
    @authors_books = @author.books.order(:name).page(params[:page]).per(20)
    @books_count = @authors_books.total_count
  end
end
