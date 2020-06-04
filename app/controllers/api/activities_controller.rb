class Api::ActivitiesController < Api::ApiController
  def index
    @activities = Activity.all
  end
end
