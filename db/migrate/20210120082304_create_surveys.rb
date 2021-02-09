class CreateSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :surveys, id: :uuid do |t|
      t.string :name
      t.integer :interval
      t.time :time_of_day
      t.integer :day_of_weeks, null: false, default: 0
      t.integer :isAnonymous
      t.references :manager
      t.timestamps
    end
  end
end
