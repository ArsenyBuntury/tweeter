# frozen_string_literal: true

class CreateTwits < ActiveRecord::Migration[7.0]
  def change
    create_table :twits do |t|
      t.string :name
      t.text :body

      t.timestamps
    end
  end
end
