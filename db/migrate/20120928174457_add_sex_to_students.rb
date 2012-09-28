class AddSexToStudents < ActiveRecord::Migration
  def change
    add_column :students, :sex, :string
    add_column :students, :birthdate, :date
  end
end
