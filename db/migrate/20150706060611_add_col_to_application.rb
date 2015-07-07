class AddColToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :schoolid, :integer
  end
end
