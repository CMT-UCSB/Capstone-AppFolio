class CreateSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :surveys do |t|
      t.uuid :survey_id
      t.datetime :deadline
      t.references :user, null: false, foreign_key: true
      t.boolean :anonymous 

      t.timestamps
    end
  end
end
