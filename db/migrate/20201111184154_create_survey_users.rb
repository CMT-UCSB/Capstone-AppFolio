class CreateSurveyUsers < ActiveRecord::Migration[6.0]

  def change
    create_table :survey_users do |t|

      t.uuid :survey_id
      t.string :manager_email,              null: false, default: ""
      t.string :user_email,  null: false, default: ""
      t.datetime :remember_created_at
      t.string :response, null: false, default: ""
      t.timestamps
    end
  end

end
