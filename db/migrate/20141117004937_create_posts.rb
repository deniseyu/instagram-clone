class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :username
      t.text :caption
      t.date :date

      t.timestamps
    end
  end
end
