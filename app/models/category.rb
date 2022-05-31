class Category < ApplicationRecord
  has_many :books,  dependent: :destroy
  
  paginates_per 5

  validates :name, presence: true
end
