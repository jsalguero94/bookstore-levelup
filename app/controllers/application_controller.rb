# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :util_variables

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:first_name, :last_name, :password, :date_of_birth, :email, :password_confirmation)
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:first_name, :last_name, :password, :date_of_birth, :email, :password_confirmation, :current_password)
    end
  end

  def util_variables
    @active_books = Book.active.count
    @inactive_books = Book.inactive.count
    @authors_with_books = Book.distinct.pluck(:author_id).count
    @authors_with_no_books = Author.count - @authors_with_books
  end
end
