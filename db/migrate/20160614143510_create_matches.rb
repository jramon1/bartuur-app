class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :code
      t.references :appreciation, index: true, foreign_key: true
      t.integer :secondary_appreciation_id, :integer

      t.timestamps null: false
    end

    add_foreign_key :matches, :appreciations, column: :secondary_appreciation_id
    add_index :matches, :secondary_appreciation_id
  end
end
