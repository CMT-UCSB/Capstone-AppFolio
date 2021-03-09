class OpenEndedResponsesController < ApplicationController
  def create
    employee = Employee.find(params[:employee_id])
    survey = Survey.find(params[:id])
    question = Question.find(params[:question_id])
    manager = Manager.find_by(id: employee.manager_id)

    this_survey_response = OpenEndedResponse.find_by(question_id: question.id, employee_id: params[:employee_id], elapsed: 0)
    if this_survey_response == nil
      @isFilled = false
    else
      @isFilled = true
    end

    sentiment = GoogleNlpSentiment.new(input_text: params[:survey][:response])

    # Rails.logger.info("\n@sentiment: #{sentiment.inspect}")
    entity = GoogleNlpEntity.new(input_text: params[:survey][:response])
    allEntities = entity.getEntities

    if @isFilled == false
      OpenEndedResponse.create!(manager: manager, employee: employee, question: question, response: params[:survey][:response], elapsed: 0,
                                score: sentiment.getScore, magnitude: sentiment.getMagnitude, sentiment: sentiment.getSentiment)

      allEntities.each do |entity|
        if entity.type == :PERSON && is_upper_case(entity.name.to_s[0,1])
          Rails.logger.info("\n --- \n entity name: #{entity.name.to_s}, is upper? left: -#{is_upper_case(entity.name.to_s[0,1])}-\n")
          # Rails.logger.info("\n --- \nSurvey: #{survey.id} ,OpenEndedResponse: #{this_survey_response.id} \n")
          entity.mentions.count.times do
            EntityNlp.create!(name: entity.name, count: 1, elapsed: 0, 
                            sentiment_score: entity.sentiment.score, sentiment_mag: entity.sentiment.magnitude,
                            salience_score: entity.salience, survey_id: survey.id, open_ended_response_id: this_survey_response.id, manager: manager)
          end
        end
      end
    else
      this_survey_response.update(response: params[:survey][:response], score: sentiment.getScore, magnitude: sentiment.getMagnitude, sentiment: sentiment.getSentiment)

      @OldEntityNlp = EntityNlp.where(open_ended_response_id: this_survey_response.id)
      # Rails.logger.info("\n --- \nOld Answers: #{@OldEntityNlp} \n")
      @OldEntityNlp.each do |e|
        e.destroy
      end
      allEntities.each do |entity|
        if entity.type == :PERSON && is_upper_case(entity.name.to_s[0,1])
          Rails.logger.info("\n --- \n entity name: #{entity.name.to_s}, is upper? left: -#{is_upper_case(entity.name.to_s[0,1])}-\n")
          entity.mentions.count.times do
            EntityNlp.create!(name: entity.name, count: 1, elapsed: 0, 
                            sentiment_score: entity.sentiment.score, sentiment_mag: entity.sentiment.magnitude,
                            salience_score: entity.salience, survey_id: survey.id, open_ended_response_id: this_survey_response.id, manager: manager)
          end
        end
      end
    end
    redirect_back(fallback_location: root_path)
  end

  def is_upper_case(letter)
    case letter
    when /[[:upper:]]/ then return true
    when /[[:lower:]]/ then return false
    else return false
    end
  end
end
