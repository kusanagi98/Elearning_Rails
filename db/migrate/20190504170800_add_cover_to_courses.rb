class AddCoverToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :cover, :string
    add_column :courses, :requirement, :text
    add_column :courses, :aim, :text
    add_column :courses, :category, :string
    change_column_default :courses, :category, "Miscellaneous"
  end
end
