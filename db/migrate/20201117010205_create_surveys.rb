class CreateSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :surveys, id: :uuid do |t|
      t.datetime :deadline
      t.references :manager
      t.boolean :anonymous 
      t.timestamps
    end
  end
end
