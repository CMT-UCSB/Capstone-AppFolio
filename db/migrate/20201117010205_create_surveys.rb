class CreateSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :surveys, id: :uuid do |t|
      t.integer :interval
      t.time :time_of_day
      t.boolean :isAnonymous
      t.references :manager
      t.timestamps
    end
  end
end
