class GoogleNlpSentiment
    def initialize(input_text:)
        @text = input_text
        puts @text
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

    def getScore
        format('%<num>0.3f', num: @sentiment.score)
    end

    def getMagnitude
        format('%<num>0.3f', num: @sentiment.magnitude)
    end

    def getSentiment
        if @sentiment.score > 0.35
            return "positive"
        elsif @sentiment.score > 0.21
            return "slightly_positive"
        elsif @sentiment.score < -0.35
            return "negative"
        elsif @sentiment.score < -0.21
            return "slightly_negative"
        elsif @sentiment.magnitude > 2.0
            return "mixed"
        else
            return "neutral"
        end
    end
end