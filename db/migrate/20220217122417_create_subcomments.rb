# frozen_string_literal: true

class CreateSubcomments < ActiveRecord::Migration[7.0]
  def change
    create_table :subcomments do |t|
      t.string :body
      t.references :commentable, polymorphic: true, null: false
      t.belongs_to :user, null: false, foreign_key: { to_table: :comments }

      t.timestamps
    end
  end
end
