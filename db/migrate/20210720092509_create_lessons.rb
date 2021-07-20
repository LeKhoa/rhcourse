class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.string :video
      t.string :title
      t.integer :length

      t.timestamps
    end
  end
end
