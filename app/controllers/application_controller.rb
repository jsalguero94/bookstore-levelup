class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :util_variables

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :password, :date_of_birth, :email, :password_confirmation)}

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :password, :date_of_birth, :email, :password_confirmation, :current_password)}
  end

  def util_variables
    @active_books = Book.where(active: true).count
    @inactive_books = Book.where(active: true).count
    @authors_with_books = Author.where("EXISTS(SELECT 1 from books where authors.id = books.author_id)").count
    @authors_with_no_books = Author.count - @authors_with_books
  end
end
