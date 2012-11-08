class AddChecksumToReports < ActiveRecord::Migration
  def change
    add_column :reports, :checksum, :string
  end
end
