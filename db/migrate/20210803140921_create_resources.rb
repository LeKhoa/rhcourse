class CreateResources < ActiveRecord::Migration[6.1]
  def change
    create_table :resources do |t|
      t.references :course, null: false, foreign_key: true
      t.string :title
      t.text :description

      t.timestamps
    end

    create_table :attachments do |t|
      t.references :resource, null: false, foreign_key: true
      t.string :name
      t.string :link

      t.timestamps
    end
  end
end
