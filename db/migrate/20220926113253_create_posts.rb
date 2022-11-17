class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :duration
      t.integer :type

      t.timestamps
    end
  end
end
