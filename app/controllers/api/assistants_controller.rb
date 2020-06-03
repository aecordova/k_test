class Api::AssistantsController < ApiController
  def index
    @assistants = Assistant.all
  end
end
