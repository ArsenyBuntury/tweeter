class CreateTwitTags < ActiveRecord::Migration[7.0]
  def change
    create_table :twit_tags do |t|
      t.belongs_to :twit, null: false, foreign_key: true
      t.belongs_to :tag, null: false, foreign_key: true

      t.timestamps
    end
    add_index :twit_tags, [:twit_id, :tag_id], unique: true 
  end
end
