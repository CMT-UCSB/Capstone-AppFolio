class GoogleNlp
    def printSentence
        require "google/cloud/language"
        #ENV["LANGUAGE_CREDENTIALS"] = "celtic-tendril-301721-9023ae324751.json"

        Google::Cloud::Language.configure do |config|
            config.credentials = JSON.parse(ENV.fetch('GOOGLE_API_CREDS'))
        end
        
        language = Google::Cloud::Language.language_service

        text_content = "Hello Worlds!"

        document = { content: text_content, type: :PLAIN_TEXT }
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