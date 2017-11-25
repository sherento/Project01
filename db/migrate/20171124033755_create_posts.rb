class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.text :image
      t.text :caption
      t.text :comment
      t.text :blog
      t.timestamps
    end
  end
end
