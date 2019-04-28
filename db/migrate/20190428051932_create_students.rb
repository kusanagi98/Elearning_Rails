class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table(:students, primary_key: 'student_id') do |t|
      t.string :name
      t.column :email, :string, unique: true
      t.string :password
      t.string :address
      t.integer :budget
      t.column :dateofBirth, :date

      t.timestamps
    end
  end
end
