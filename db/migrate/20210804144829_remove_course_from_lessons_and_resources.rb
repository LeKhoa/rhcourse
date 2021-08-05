class RemoveCourseFromLessonsAndResources < ActiveRecord::Migration[6.1]
  def change
    remove_reference :lessons, :course, foreign_key: true
    remove_reference :resources, :course, foreign_key: true

    add_reference :lessons, :section, foreign_key: true
    add_reference :resources, :section, foreign_key: true
  end
end
