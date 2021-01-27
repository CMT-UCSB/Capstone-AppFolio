class GoogleNlpSentiment
    def initialize(input_text:)
        @text = input_text
    end

    def printResult
        require "google/cloud/language"

        # set google credential
        # credential is stored in .env file
        Google::Cloud::Language.configure do |config|
            config.credentials = JSON.parse(ENV.fetch('GOOGLE_API_CREDS'))
        end
        
        language = Google::Cloud::Language.language_service

        text_content = "Hello Worlds!"

        # text_content is the string which will be analyze by the NLP
        document = { content: @text, type: :PLAIN_TEXT }
        response = language.analyze_sentiment document: document

        sentiment = response.document_sentiment

        puts "Overall document sentiment: (#{sentiment.score})"
        puts "Sentence level sentiment:"

        sentences = response.sentences

        sentences.each do |sentence|
            sentiment = sentence.sentiment
            puts "#{sentence.text.content}: (#{sentiment.score})"
        end
        
    end
end