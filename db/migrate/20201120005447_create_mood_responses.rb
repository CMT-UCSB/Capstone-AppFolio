class CreateMoodResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :mood_responses do |t|
      t.integer :response
      t.integer :elapsed
      t.references :question
      t.references :employee, index: true, type: :uuid
      t.timestamps
    end
  end
end
