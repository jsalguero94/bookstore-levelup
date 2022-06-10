# frozen_string_literal: true

class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  paginates_per 20

  validates :name, presence: true
end
