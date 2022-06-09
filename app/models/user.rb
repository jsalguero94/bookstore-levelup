class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :requests, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :commented_books, through: :book_comments, source: :book

  validates :first_name, :last_name, :date_of_birth, presence: true
end
