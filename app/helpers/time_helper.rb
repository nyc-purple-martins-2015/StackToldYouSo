module TimeHelper
  def time_since_created(remark)
    time = (Time.now.hour-remark.created_at.localtime.hour).abs
    if time <= 1
      return "less than 1 hour ago"
    else
      return "#{time} hours ago"
    end
  end

  def time_since_updated(remark)
    time = (Time.now.hour-remark.updated_at.localtime.hour).abs
    if time <= 1
      return "less than 1 hour ago"
    else
      return "#{time} hours ago"
    end
  end
end
