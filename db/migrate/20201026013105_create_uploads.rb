# frozen_string_literal: true

class CreateUploads < ActiveRecord::Migration[6.0]
  def change
    create_table :uploads do |t|
      t.bigint :payment_id

      t.timestamps
    end
    add_index :uploads, :payment_id
  end
end
