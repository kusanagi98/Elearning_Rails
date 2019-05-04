class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses, primary_key: 'course_id' do |t|
      t.string :name
      t.integer :fee
      t.string :description

      t.timestamps
    end
  end
end
