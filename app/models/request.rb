class Request < ApplicationRecord

  belongs_to :user

  scope :by_user, -> (current_user) {
    where("user_id = #{current_user}") 
  }

  validates :name_of_book, presence: true

  validates :name_of_book, format:{with: /[a-zA-Z0-9]+/, message: "only letters and numbers"}
  validates :name_of_book, length: { maximum: 30 }

end
