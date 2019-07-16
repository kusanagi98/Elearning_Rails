class AddAvatarToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :avatar, :string
  end
end
