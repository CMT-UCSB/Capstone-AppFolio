class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :prompt
      t.integer :question_type
      t.references :survey, index: true, type: :uuid
      t.timestamps
    end
    add_index :questions, [:created_at]
  end
end
