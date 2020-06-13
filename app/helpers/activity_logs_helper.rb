module ActivityLogsHelper
  def status_in_words(status)
    # 1:on, 0:off, When the activity is in progress it's ON, hence: 1.
    ['Terminado', 'En progreso'][status]
  end

  def format_time(time)
    time.strftime('%F  %T')
  end

  def list(activity_logs, att1, att2 = nil)
    activity_logs.map do |al|
      if att2.nil?
        al.send(att1)
      else
        al.send(att1).send(att2)
      end
    end
      .uniq
  end
end
