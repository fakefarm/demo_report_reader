# frozen_string_literal: true

class CreateSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :searches do |t|
      t.string :term

      t.timestamps
    end
  end
end
