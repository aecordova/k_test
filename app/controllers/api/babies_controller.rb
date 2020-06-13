class Api::BabiesController < Api::ApiController
  def index
    @babies = Baby.all
  end
end
