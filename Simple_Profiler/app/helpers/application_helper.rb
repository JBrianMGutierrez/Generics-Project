module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'Simple Profiler'
    if page_title.empty?
      base_title
    else
      page_title + ' |  ' + base_title
    end
  end

  def full_name(first_name, last_name)
    first_name + ' ' + last_name
  end

  def age(dob)
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end
end
