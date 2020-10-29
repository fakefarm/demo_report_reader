# frozen_string_literal: true

class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.date :date
      t.string :report_date
      t.string :report_name
      t.string :page
      t.string :code
      t.string :description
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
