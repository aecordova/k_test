class Api::ActivityLogsController < Api::ApiController
  before_action :fetch_baby, only: [:index]
  before_action :fetch_activity_log, only: [:update]

  def index
    @activity_logs = ActivityLog.all.baby_filtered(@baby)
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

  def fetch_baby
    return if params[:baby_id].nil?

    @baby = Baby.find(params[:baby_id])
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
