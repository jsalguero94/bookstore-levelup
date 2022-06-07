# frozen_string_literal: true

class Request < ApplicationRecord
  belongs_to :user

  validates :name_of_book,
            presence: true,
            format:
            {
              with: /\A[a-zA-Z0-9]+\z/,
              message: 'only letters and numbers'
            },
            length: { maximum: 30 }
end
