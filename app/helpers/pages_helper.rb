module PagesHelper

  def most_mentioned_name
    e = EntityNlp.where(manager_id: current_manager.id)
    e = e.where(survey_id: @wordcloud_surveys)
    e = e.where(elapsed: @selected_elapsed)
    e_mmn = e.group(:name).sum(:count).sort_by(&:last).reverse
    e_mmn
  end

  def most_positive
    e = EntityNlp.where(manager_id: current_manager.id)
    e = e.where(survey_id: @wordcloud_surveys)
    e = e.where(elapsed: @selected_elapsed)
    e_pos = e.group(:name).average(:sentiment_score).sort_by(&:last).reverse
    e_pos = e_pos.select { |result| result[1] > 0 }
    # Rails.logger.info(" --- e4: #{e_pos}\n")
    e_pos
  end

  def most_negative
    e = EntityNlp.where(manager_id: current_manager.id)
    e = e.where(survey_id: @wordcloud_surveys)
    e = e.where(elapsed: @selected_elapsed)
    e_neg = e.group(:name).average(:sentiment_score).sort_by(&:last)
    e_neg = e_neg.select { |result| result[1] < 0 }
    e_neg
  end


  def mean(array)
    array.inject(0) { |sum, x| sum += x } / array.size.to_f
  end

  def standard_deviation(array)
    if array.length == 1
      return 0.0
    end
    m = mean(array)
    variance = array.inject(0) { |variance, x| variance += (x - m) ** 2 }
    return Math.sqrt(variance/(array.size-1))
  end

  def most_controversial
    e = EntityNlp.where(manager_id: current_manager.id)
    e = e.where(survey_id: @wordcloud_surveys)
    e = e.where(elapsed: @selected_elapsed)
    calculated = []
    e.group_by(&:name).each do |person|
      allScores = []
      personName = ""
      #person[1] is the array you wanna use, person[0] is just a string of the name
      person[1].each do |mention|
        personName = mention.name
        allScores << mention.sentiment_score.round(4)
      end
      # Rails.logger.info("\n ------- #{personName} --- his/her allScores: #{allScores}\n")
      # Rails.logger.info(" --- standard dev: #{standard_deviation(allScores)}\n")
      # sample standard deviation
      calculated << [personName, standard_deviation(allScores)]
    end
    e_mc = calculated.sort_by(&:last).reverse
    # Rails.logger.info(" --- most controversial list: #{e_mc}\n")
    e_mc = e_mc.select { |result| result[1] > 0 }
    e_mc
  end

  def most_improve_review
    e = EntityNlp.where(manager_id: current_manager.id)
    e = e.where(survey_id: @wordcloud_surveys)
    current = e.where(elapsed: @selected_elapsed)
    last = e.where(elapsed: @selected_elapsed.to_i+1) #change to 1
    current_pos = current.group(:name).average(:sentiment_score).sort_by(&:last).reverse
    last_pos = last.group(:name).average(:sentiment_score).sort_by(&:last).reverse
    # Rails.logger.info(" --- current pos: #{current_pos}\n")
    # Rails.logger.info(" --- last pos: #{last_pos}\n")
    
    same_name = []
    current_pos.each_with_index do |cur,index|
      cur_name = cur[0]
      last_pos.each_with_index do |last,index|
        last_name = last[0]
        if cur_name == last_name
          same_name << [cur_name, (cur[1]-last[1]).round(3)]
        end
      end
    end
    most_improve_review = same_name.sort_by(&:last).reverse
    most_improve_review = most_improve_review.select { |result| result[1] > 0 }
    return most_improve_review
  end

  def most_drop_review
    e = EntityNlp.where(manager_id: current_manager.id)
    e = e.where(survey_id: @wordcloud_surveys)
    current = e.where(elapsed: @selected_elapsed)
    last = e.where(elapsed: @selected_elapsed.to_i+1) #change to 1
    current_pos = current.group(:name).average(:sentiment_score).sort_by(&:last).reverse
    last_pos = last.group(:name).average(:sentiment_score).sort_by(&:last).reverse
    
    same_name = []
    current_pos.each_with_index do |cur,index|
      cur_name = cur[0]
      last_pos.each_with_index do |last,index|
        last_name = last[0]
        if cur_name == last_name
          same_name << [cur_name, (cur[1]-last[1]).round(3)]
        end
      end
    end
    same_name.sort_by(&:last).reverse

    most_drop_review = same_name.sort_by(&:last)
    most_drop_review = most_drop_review.select { |result| result[1] > 0 }
    return most_drop_review
  end


end