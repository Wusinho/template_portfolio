class ScrapperController < ApplicationController
  helper ScrapperHelper
  def index
    @about_me = ScrapperServices.call
    render json: @about_me
  end
end
