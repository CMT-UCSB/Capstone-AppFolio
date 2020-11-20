class CreateOpenEndedResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :open_ended_responses do |t|
      t.string :response
      t.references :question
      t.references :employee
      t.timestamps
    end
  end
end
