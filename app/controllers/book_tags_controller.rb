class BookTagsController < ApplicationController
  before_action :set_book_tag, only: %i[ show edit update destroy ]

  # GET /book_tags or /book_tags.json
  def index
    @book_tags = BookTag.all
  end

  # GET /book_tags/1 or /book_tags/1.json
  def show
  end

  # GET /book_tags/new
  def new
    @book_tag = BookTag.new
  end

  # GET /book_tags/1/edit
  def edit
  end

  # POST /book_tags or /book_tags.json
  def create
    @book_tag = BookTag.new(book_tag_params)

    respond_to do |format|
      if @book_tag.save
        format.html { redirect_to book_tag_path(@book_tag), notice: "Book tag was successfully created." }
        format.json { render :show, status: :created, location: @book_tag }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_tags/1 or /book_tags/1.json
  def update
    respond_to do |format|
      if @book_tag.update(book_tag_params)
        format.html { redirect_to book_tag_path(@book_tag), notice: "Book tag was successfully updated." }
        format.json { render :show, status: :ok, location: @book_tag }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_tags/1 or /book_tags/1.json
  def destroy
    @book_tag.destroy

    respond_to do |format|
      format.html { redirect_to book_tags_path, notice: "Book tag was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_tag
      @book_tag = BookTag.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_tag_params
      params.fetch(:book_tag, {})
    end
end
