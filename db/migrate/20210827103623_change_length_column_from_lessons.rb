class ChangeLengthColumnFromLessons < ActiveRecord::Migration[6.1]
  def up
    change_column :lessons, :length, :string
  end

  def down
  end
end
