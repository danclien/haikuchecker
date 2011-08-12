class CreateWords < ActiveRecord::Migration
  def self.up
    create_table :words do |t|
      t.string :word
      t.integer :length

      t.timestamps
    end
    
    add_index :words, :word
  end

  def self.down
    drop_table :words
  end
end
