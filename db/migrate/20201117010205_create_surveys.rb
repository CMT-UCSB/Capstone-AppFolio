class CreateSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :surveys, id: :uuid do |t|
      t.datetime :deadline
      t.boolean :anonymous
      t.references :manager
      t.timestamps
    end
  end
end
