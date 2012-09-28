class AddOrderNumberToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :order_number, :integer, :default => 0
  end
end
