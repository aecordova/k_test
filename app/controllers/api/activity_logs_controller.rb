class Api::ActivityLogsController < ApplicationController
  before_action :set_baby, only: [:index]

  def index
    @activity_logs = @baby.activity_logs
  end

  private

  def set_baby
    @baby = Baby.find(params[:baby_id])
  end
end
