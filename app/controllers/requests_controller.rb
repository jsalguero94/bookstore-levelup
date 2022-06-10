# frozen_string_literal: true

class RequestsController < ApplicationController
  before_action :set_request, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @requests = current_user.requests
  end

  def show; end

  def new
    @request = current_user.requests.build
  end

  def edit; end

  def create
    @request = current_user.requests.build(request_params)
    respond_to do |format|
      if @request.save
        format.html { redirect_to request_path(@request), notice: t('.success') }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to request_path(@request), notice: t('.success') }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @request.destroy

    respond_to do |format|
      format.html { redirect_to requests_path, notice: t('.success') }
    end
  end

  private

  def set_request
    @request = current_user.requests.find(params[:id])
  end

  def request_params
    params.require(:request).permit(:name_of_book)
  end
end
