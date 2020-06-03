module ActivityLogsHelper
  def status_in_words(status)
    ['En proceso', 'Terminado'][status]
  end

  def format_time(time)
    time.strftime('%F  %T')
  end

end
