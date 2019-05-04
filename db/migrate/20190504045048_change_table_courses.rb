class ChangeTableCourses < ActiveRecord::Migration[5.2]
  def change
    change_column(:courses, :description, :text)
    change_column_default(:courses, :fee, 0)
    add_column(:courses, :student_id, :integer)
  end
end
