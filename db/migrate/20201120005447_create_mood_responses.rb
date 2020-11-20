class CreateMoodResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :mood_responses do |t|
      t.integer :response
      t.references :question
      t.references :employee
      t.timestamps
    end
  end
end
