class HomepagesController < ApplicationController
  before_action :github_information, only: [:index]
  def index
    @time = Time.now
  end

  private

  def github_information
    user = User.create_update_profile
    @user = JSON.parse(user.information)
    @cv = ENV['GOOGLE_CV']
  end



end
