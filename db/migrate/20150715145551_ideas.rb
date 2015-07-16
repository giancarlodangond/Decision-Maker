class Ideas < ActiveRecord::Migration
  def up
    create_table :ideas do |t|
      t.string :name
    end
  end
  
  def down
    drop_table :ideas
  end
end
