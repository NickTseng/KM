class RemoveTaglistFromPost < ActiveRecord::Migration
  def change
    remove_column :posts, :tag_list
  end
end
