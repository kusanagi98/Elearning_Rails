class AddForeignKeyPls < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :courses, :students, primary_key: :student_id
  end
end
