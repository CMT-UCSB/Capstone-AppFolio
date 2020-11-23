class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :prompt
      t.integer :type
      t.references :survey
      t.timestamps
    end
    add_index :questions, [:created_at]
  end
end