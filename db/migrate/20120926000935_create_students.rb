class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.integer :number
      t.string :first_name
      t.string :last_name
      t.string :level
      t.string :language_classification

      t.timestamps
    end
  end
end
