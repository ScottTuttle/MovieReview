module CommentsHelper
  def relative_date(date)
    if 1.day.ago < date
      time_ago_in_words(date) + " ago"
    elsif 2.days.ago < date
      date.getlocal.strftime("Yesterday at %I:%M %p")
    elsif 4.days.ago < date
      date.getlocal.strftime("%A at %I:%M %p")
    else
      date.getlocal.strftime("%B %d, %Y at %I:%M %p")
    end
  end
end
