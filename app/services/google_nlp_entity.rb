class GoogleNlpEntity
  def initialize(input_text:)
      @text = input_text
      puts @text
      require "google/cloud/language"
      require "json"

      # set google credential
      # credential is stored in .env file
      Google::Cloud::Language.configure do |config|
          config.credentials = JSON.parse(ENV.fetch('GOOGLE_API_CREDS'))
      end

      language = Google::Cloud::Language.language_service

      # text is the string which will be analyze by the NLP
      document = { content: @text, type: :PLAIN_TEXT }
      response = language.analyze_entity_sentiment document: document

      @entityList = []
      response.entities.each do |entity|
        puts "Entity: #{entity.name}, Sentiment: #{entity.sentiment.score}, Magnitude: #{entity.sentiment.magnitude}, type: #{entity.type}, salience score: #{entity.salience}, mention count: #{entity.mentions.count}"
        @entityList << entity
      end      
      
      
  end

  def getEntities
    @entityList
  end

end