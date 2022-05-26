class Book < ApplicationRecord
  belongs_to :category
  belongs_to :author
  has_many :book_tags, dependent: :destroy
  has_many :tags, through: :book_tags
  has_many :comments, dependent: :destroy
  has_many :users, through: :comments
end
