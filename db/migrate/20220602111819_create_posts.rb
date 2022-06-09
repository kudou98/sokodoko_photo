class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.integer :user_id
      t.string :post_image_id
      t.text :body
      t.string :location

      t.timestamps
    end
  end
end
