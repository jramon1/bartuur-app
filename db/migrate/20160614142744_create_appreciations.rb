class CreateAppreciations < ActiveRecord::Migration
  def change
    create_table :appreciations do |t|
      t.boolean :liked, default: false
      t.references :user, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
