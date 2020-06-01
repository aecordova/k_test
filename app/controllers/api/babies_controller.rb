class Api::BabiesController < ApiController
  def index
    @babies = Baby.all
  end
end
