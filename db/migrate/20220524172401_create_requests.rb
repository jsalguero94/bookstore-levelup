class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.string :name_of_book

      t.timestamps
    end
  end
end
