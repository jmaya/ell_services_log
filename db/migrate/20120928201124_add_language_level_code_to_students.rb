class AddLanguageLevelCodeToStudents < ActiveRecord::Migration
  def change
    add_column :students, :language_level_code, :string
  end
end
