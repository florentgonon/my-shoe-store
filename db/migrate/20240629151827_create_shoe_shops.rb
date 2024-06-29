class CreateShoeShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shoe_shops do |t|
      t.references :shoe, null: false, foreign_key: true
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
