class GoogleNlpSentiment
    def initialize(input_text:)
        @text = input_text
        require "google/cloud/language"

        # set google credential
        # credential is stored in .env file
        Google::Cloud::Language.configure do |config|
            config.credentials = JSON.parse(ENV.fetch('GOOGLE_API_CREDS'))
        end

        language = Google::Cloud::Language.language_service

        # text is the string which will be analyze by the NLP
        document = { content: @text, type: :PLAIN_TEXT }
        response = language.analyze_sentiment document: document

        @sentiment = response.document_sentiment
    end

    def printScore
        @sentiment.score
    end

    def printMagnitude
        @sentiment.magnitude
    end
end