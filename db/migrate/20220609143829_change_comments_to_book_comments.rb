class ChangeCommentsToBookComments < ActiveRecord::Migration[7.0]
  def change
    rename_table :comments, :book_comments
  end
end
