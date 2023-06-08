class HomepagesController < ApplicationController
  include Geteable
  before_action :github_information, only: [:index]
  def index
    @time = Time.now
  end

  private

  def github_information
    user = User.first || User.create(information: git_hub_info)
    @user = JSON.parse(user.information)
    @cv = ENV['GOOGLE_CV']
  end



end
