class CreateFavorits < ActiveRecord::Migration[6.0]
  def change
    create_table :favorits do |t|
      t.references :user, null: false, foreign_key: true
      t.references :tune, null: false, foreign_key: true

      t.timestamps
    end
  end
end
