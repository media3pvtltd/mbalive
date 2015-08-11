class AddColToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :user_type, :string
  end
end
