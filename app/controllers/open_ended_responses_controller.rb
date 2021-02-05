class OpenEndedResponsesController < ApplicationController
  def create
    employee = Employee.find(params[:employee_id])
    survey = Survey.find(params[:id])
    question = Question.find(params[:question_id])

    this_survey_response = OpenEndedResponse.find_by(question_id: question.id, employee_id: params[:employee_id])
    if this_survey_response == nil
        @isFilled = false
    else
        # check if if has been at least one week since a response has last been saved
        weeks = ((DateTime.now.utc - this_survey_response.created_at) / (60 * 60 * 24 * 7))
        this_survey_response.update(elapsed_weeks: weeks)
        if this_survey_response.elapsed_weeks > 0
          @isFilled = false
        else
          @isFilled = true
        end
    end

    sentiment = GoogleNlpSentiment.new(input_text: params[:survey][:response])

    Rails.logger.info("\n@sentiment: #{sentiment.inspect}")
    entity = GoogleNlpEntity.new(input_text: params[:survey][:response])
    allEntities = entity.getEntities

    if @isFilled == false
        OpenEndedResponse.create!(employee: employee, question: question, response: params[:survey][:response], elapsed_weeks: 0,
                                  score: sentiment.getScore, magnitude: sentiment.getMagnitude, sentiment: sentiment.getSentiment)
        
        allEntities.each do |entity|
          if entity.type == :PERSON
            Rails.logger.info("\n --- \nSurvey: #{survey.id} ,OpenEndedResponse: #{this_survey_response.id} \n")
            EntityNlp.create!(name: entity.name, count: entity.mentions.count,
              sentiment_score: entity.sentiment.score, sentiment_mag: entity.sentiment.magnitude, 
              salience_score: entity.salience, survey_id: survey.id, open_ended_response_id: this_survey_response.id)
          end 
        end
                                  
    else
        this_survey_response.update(response: params[:survey][:response], score: sentiment.getScore, magnitude: sentiment.getMagnitude, sentiment: sentiment.getSentiment)
        
        @OldEntityNlp = EntityNlp.where(open_ended_response_id: this_survey_response.id)
        Rails.logger.info("\n --- \nOld Answers: #{@OldEntityNlp} \n")
        @OldEntityNlp.each do |e|
          e.destroy
        end
        allEntities.each do |entity|
          if entity.type == :PERSON
            EntityNlp.create!(name: entity.name, count: entity.mentions.count,
             sentiment_score: entity.sentiment.score, sentiment_mag: entity.sentiment.magnitude, 
             salience_score: entity.salience, survey_id: survey.id, open_ended_response_id: this_survey_response.id)
          end 
        end
    end
    redirect_back(fallback_location: root_path)
  end
end