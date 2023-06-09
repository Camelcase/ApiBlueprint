# frozen_string_literal: true

class CreateBookstores < ActiveRecord::Migration[7.0]
  def change
    create_table :bookstores do |t|
      t.string :name
      t.string :location

      t.timestamps
    end
  end
end
