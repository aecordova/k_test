class ActivityLogsController < ApplicationController
  def index
    @activity_logs = ActivityLog.all
  end


end
