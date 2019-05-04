class AddTeacherToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :teacher, :boolean, default: false
  end
end
