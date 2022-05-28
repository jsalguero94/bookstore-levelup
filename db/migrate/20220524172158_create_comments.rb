class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :message
      t.boolean :approved, :default => false

      t.timestamps
    end
  end
end
