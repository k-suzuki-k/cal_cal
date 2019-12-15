class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.integer :user_id, null: false
      t.date :day, null: false
      t.string :title
      t.time :start_time
      t.time :end_time
      t.integer :category
      t.text :content
      t.string :image

      t.timestamps
    end
  end
end
