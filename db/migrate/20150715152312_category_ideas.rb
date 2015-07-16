class CategoryIdeas < ActiveRecord::Migration
  def up
    create_table :category_ideas do |t|
      t.integer :idea_id
      t.integer :category_id
    end
  end
  
  def down
    drop_table :category_ideas
  end
end
