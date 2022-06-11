class CreatePostTags < ActiveRecord::Migration[6.1]
  def change
    create_table :post_tags do |t|
      
      t.integer :posts_id
      t.integer :tags_id

      t.timestamps
    end
  end
end
