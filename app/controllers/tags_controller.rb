class TagsController < ApplicationController
  before_action :set_tag, only: %i[ show edit update destroy ]
  before_action :books, only: :show

  def index
    @tags = Tag.order(:name).page params[:page]
  end

  def show
  end

  def new
    @tag = Tag.new
  end

  def edit
  end

  def create
    @tag = Tag.new(tag_params)

    respond_to do |format|
      if @tag.save
        format.html { redirect_to tag_path(@tag), notice: "Tag was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to tag_path(@tag), notice: "Tag was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tag.destroy

    respond_to do |format|
      format.html { redirect_to tags_path, notice: "Tag was successfully destroyed." }
    end
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end

  def books
    @books_pagination = @tag.books.order(:name).page(params[:page]).per(20)
    @book_count = @books_pagination.total_count
  end
end
