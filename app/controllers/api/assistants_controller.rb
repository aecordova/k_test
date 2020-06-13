class Api::AssistantsController < Api::ApiController
  def index
    @assistants = Assistant.all
  end
end
