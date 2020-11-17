class CreateSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :surveys do |t|
      t.uuid :survey_id
      t.datetime :completion_time
      t.datetime :deadline
      t.references :employee, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :filled
      t.boolean :anonymous

      t.timestamps
    end
  end
end
