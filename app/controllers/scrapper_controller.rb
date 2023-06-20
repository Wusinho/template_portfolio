class ScrapperController < ApplicationController
  def index
    @about_me = ScrapperServices.call

    render json: @about_me

  end
end
