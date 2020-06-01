class Api::ActivitiesController < ApiController
  def index
    @activities = Activity.all
  end
end
