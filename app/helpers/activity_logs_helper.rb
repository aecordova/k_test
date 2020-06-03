module ActivityLogsHelper
  def status_in_words(status)
    ['En proceso', 'Terminado'][status]
  end

  def format_time(time)
    time.strftime('%F  %T')
  end

  def list(activity_logs, att1, att2=nil)
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
