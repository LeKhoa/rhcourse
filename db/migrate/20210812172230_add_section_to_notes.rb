class AddSectionToNotes < ActiveRecord::Migration[6.1]
  def change
    add_reference :notes, :section, foreign_key: true

    remove_reference :notes, :lesson, foreign_key: true
  end
end
