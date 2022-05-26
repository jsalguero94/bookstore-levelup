class AddTagAndBookToBookTags < ActiveRecord::Migration[7.0]
  def change
    add_reference :book_tags, :tag, null: false, foreign_key: true
    add_reference :book_tags, :book, null: false, foreign_key: true
  end
end
