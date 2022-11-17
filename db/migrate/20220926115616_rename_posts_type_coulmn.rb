class RenamePostsTypeCoulmn < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :type, :mulitmedia_type
  end
end
