class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.uuid :code
      t.string :name
      t.text :description
      t.money :price
      t.integer :number_of_pages
      t.datetime :date_published
      t.boolean :active

      t.timestamps
    end
  end
end
