class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.date :date
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :notes, [:created_at]
  end
end
