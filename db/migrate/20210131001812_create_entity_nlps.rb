class CreateEntityNlps < ActiveRecord::Migration[6.0]
  def change
    create_table :entity_nlps do |t|
      t.string :name
      t.integer :count
      t.integer :elapsed
      t.decimal :sentiment_score
      t.decimal :sentiment_mag
      t.decimal :salience_score
      t.references :manager
      t.references :survey, index: true, type: :uuid
      t.references :open_ended_response
    end
  end
end
