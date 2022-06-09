class Author < ApplicationRecord
  attr_readonly :name
  has_many :books, dependent: :destroy

  paginates_per 20

  validates :name, presence: true
end
