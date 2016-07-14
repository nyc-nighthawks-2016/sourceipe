module ApplicationHelper
  def time_since_creation(arg)
    time = Time.now - arg.created_at #in seconds
    if time > 86400
      "#{(time / (3600 * 24)).floor} days ago"
    elsif time > 3600 && time < 86400
      "#{(time / (3600)).floor} hours ago"
    elsif time > 60 && time < 3600
      "#{(time / (60)).floor} minutes ago"
    else
      "#{(time).floor} seconds ago"
    end
  end
end
