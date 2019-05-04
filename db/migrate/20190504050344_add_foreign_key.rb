class AddForeignKey < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key(:courses, :students)
  end
end
