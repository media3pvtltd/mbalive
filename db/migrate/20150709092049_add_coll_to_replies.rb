class AddCollToReplies < ActiveRecord::Migration
  def change
    add_column :replies, :from, :string
    add_column :replies, :to, :string
  end
end
