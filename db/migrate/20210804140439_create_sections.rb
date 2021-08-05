class CreateSections < ActiveRecord::Migration[6.1]
  def change
    create_table :sections do |t|
      t.references :course, null: false, foreign_key: true
      t.string :name
      t.boolean :active, default: true
      t.integer :priority, default: 0

      t.timestamps
    end
  end
end
