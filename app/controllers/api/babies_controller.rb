class Api::BabiesController < ApplicationController
  def index
    @babies = Baby.all
  end
end
