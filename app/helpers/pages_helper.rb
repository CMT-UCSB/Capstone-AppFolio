module PagesHelper

  def most_mentioned_name
    e = EntityNlp.where(elapsed: 0)
    e_mmn = e.group(:name).sum(:count).sort_by(&:last).reverse
    e_mmn
  end

  def most_positive
    e = EntityNlp.where(elapsed: 0)
    e_pos = e.group(:name).average(:sentiment_score).sort_by(&:last).reverse
    # Rails.logger.info("\n ------- e_pos: \n #{e_pos}")
    e_pos
  end

  def most_negative
    e = EntityNlp.where(elapsed: 0)
    e_neg = e.group(:name).average(:sentiment_score).sort_by(&:last)
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
    e = EntityNlp.where(elapsed: 0)
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
      calculated << [personName, standard_deviation(allScores)]
    end
    e_mc = calculated.sort_by(&:last).reverse
  end

  def most_improve_review
    current = EntityNlp.where(elapsed: 0)
    last = EntityNlp.where(elapsed: 1) #change to 1
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
    return most_improve_review
  end

  def most_drop_review
    current = EntityNlp.where(elapsed: 0)
    last = EntityNlp.where(elapsed: 1) #change to 1
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
    return most_drop_review
  end

end