class ActivityLogsController < ApplicationController
  def index
    @activity_logs = ActivityLog.all.includes(:baby, :assistant, :activity).newest_first
  end
end
