class Api::ActivityLogsController < ApiController
  before_action :get_baby, only: [:index]
  before_action :get_activity_log, only: [:update]

  def index
    @activity_logs = @baby.activity_logs
  end

  def create
    render json: @activity_log, status: :ok if @activity_log = ActivityLog.create(new_activity_log_params)
  end

  def update
    if @activity_log.update!(upd_activity_log_params)
      render json: @activity_log, status: :ok
      puts 'updated'
    end
  end

  private

  def get_baby
    @baby = Baby.find(params[:baby_id])
  end

  def get_activity_log
    @activity_log = ActivityLog.find(params[:id])
  end

  def new_activity_log_params
    params.require(:activity_log).permit(:baby_id, :assistant_id, :activity_id, :start_time)
  end

  def upd_activity_log_params
    params.require(:activity_log).permit(:stop_time, :comments)
  end
end
