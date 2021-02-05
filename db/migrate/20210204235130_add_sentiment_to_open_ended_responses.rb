class AddSentimentToOpenEndedResponses < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      CREATE TYPE sentiment AS ENUM ('neutral', 'mixed', 'slightly_negative', 'negative', 'slightly_positive', 'positive');
    SQL
    add_column :open_ended_responses, :sentiment, :sentiment
  end

  def down
    remove_column :open_ended_responses, :sentiment
    execute <<-SQL
      DROP TYPE sentiment;
    SQL
  end
end
