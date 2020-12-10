class CreateOpenEndedResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :open_ended_responses do |t|
      t.string :response
      t.integer :elapsed_weeks
      t.references :question
      t.references :employee, index: true, type: :uuid
      t.timestamps
    end
  end
end
