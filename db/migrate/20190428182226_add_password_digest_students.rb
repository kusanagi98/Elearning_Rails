class AddPasswordDigestStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :password_digest, :string
    remove_column :students, :password
  end
end
