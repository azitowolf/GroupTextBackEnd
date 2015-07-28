class CreatePtexts < ActiveRecord::Migration
  def change
    create_table :ptexts do |t|
      t.text :history
      t.text :text
      t.integer :number
      t.text :image
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
