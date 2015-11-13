module TimeHelper
  def time_since_created(remark)
    time = remark.created_at.hour-Time.now.utc.hour
    if time < 1
      return "less than one hour ago"
    else
      return "#{time} hours ago"
    end
  end

  def time_since_updated(remark)
    time = remark.updated_at.hour-Time.now.utc.hour
    if time < 1
      return "less than one hour ago"
    else
      return "#{time} hours ago"
    end
  end
end
