class CreateEntryTasks < ActiveRecord::Migration
  def change
    create_table :entry_tasks do |t|
      t.integer :entry_id
      t.integer :task_id
    end
  end
end
