# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :book_tags, dependent: :destroy
  has_many :books, through: :book_tags

  paginates_per 5

  validates :name, presence: true
end
