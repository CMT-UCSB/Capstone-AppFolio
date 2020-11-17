class CreateSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :surveys do |t|
      t.uuid :surveyToken
      t.datetime :creation
      t.datetime :deadline
      t.references :employee_email, null: false, foreign_key: true
      t.references :user_id, null: false, foreign_key: true
      t.boolean :filled
      t.boolean :anonymous

      t.timestamps
    end
  end
end
