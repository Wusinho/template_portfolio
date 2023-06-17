class HomepagesController < ApplicationController
  before_action :github_information, only: [:index]
  def index
    @time = Time.now
  end

  private

  def github_information
    @user = ProfileServices.fetch_user_info


    @cv = ENV['GOOGLE_CV']
  end



end
