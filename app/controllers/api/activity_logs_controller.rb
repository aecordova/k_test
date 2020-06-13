class Api::ActivityLogsController < Api::ApiController
  before_action :fetch_activity_log, only: [:update] # single
  before_action :fetch_activity_logs, only: [:index] # collection, filtered

  def index
    @activity_logs
  end

  def create
    return unless @activity_log = ActivityLog.create(new_activity_log_params)

    render json: @activity_log, status: :ok
  end

  def update
    return unless @activity_log.update!(upd_activity_log_params)

    render json: @activity_log, status: :ok
  end

  private

  def fetch_activity_logs
    # To AVOID SQL INJECTION, Super important to explicitly accept only the parameters we need when using filter_by. 
    @activity_logs = if params[:baby_id].nil?
                      ActivityLog.all
                    else
                      ActivityLog.filter_by(params.slice(:baby_id))
                    end
  end

  def fetch_activity_log
    @activity_log = ActivityLog.find(params[:id])
  end

  def new_activity_log_params
    params.require(:activity_log).permit(:baby_id, :assistant_id, :activity_id, :start_time)
  end

  def upd_activity_log_params
    params.require(:activity_log).permit(:stop_time, :comments)
  end
end
