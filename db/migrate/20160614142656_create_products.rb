class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :dislikes, default: 0
      t.boolean :delivered, default: false
      t.integer :value
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
