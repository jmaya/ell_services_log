class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.date :date_of_service
      t.integer :duration_of_service
      t.string :group_size

      t.timestamps
    end
  end
end
