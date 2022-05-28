class Author < ApplicationRecord
  attr_readonly :name
  has_many :books, dependent: :destroy

  validates :name, presence: true
end
