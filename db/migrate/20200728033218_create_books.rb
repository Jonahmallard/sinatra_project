class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :book
      t.boolean :complete
      t.integer :user_id
    end
  end
end
