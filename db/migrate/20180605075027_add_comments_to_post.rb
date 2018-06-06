class AddCommentsToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :comment_id, :integer, foreign_key: true
  end
end
