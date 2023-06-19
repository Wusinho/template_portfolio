class HomepagesController < ApplicationController
  before_action :github_information, only: [:index]
  def index
    ScrapperJob.perform_later
  end

  private

  def github_information
    @user = ProfileServices.call


    @cv = ENV['GOOGLE_CV']
  end



end
