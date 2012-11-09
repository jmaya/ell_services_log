class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
      t.string :name
      t.string :grade
      t.references :student
      t.date :assessed_at
      t.timestamps
    end
    add_index :assessments, :student_id
  end
end
