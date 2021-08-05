class AddActiveAndPriorityToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :priority, :integer, default: 0
    add_column :courses, :active, :boolean, default: true
  end
end
