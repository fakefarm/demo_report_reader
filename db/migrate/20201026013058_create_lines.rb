# frozen_string_literal: true

class CreateLines < ActiveRecord::Migration[6.0]
  def change
    create_table :lines do |t|
      t.date :date
      t.string :invoice
      t.string :description
      t.decimal :discount, precision: 15, scale: 4
      t.decimal :amount, precision: 15, scale: 4
      t.decimal :net, precision: 15, scale: 4
      t.references :payment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
