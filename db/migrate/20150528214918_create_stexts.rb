class CreateStexts < ActiveRecord::Migration
  def change
    create_table :stexts do |t|
      t.text :text
      t.references :user, index: true, foreign_key: true
      t.references :ptext, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
