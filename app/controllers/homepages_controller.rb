class HomepagesController < ApplicationController
  include Geteable
  before_action :github_information, only: [:index]
  def index
    @time = Time.now
  end

  private

  def github_information
    @user = git_hub_info
  end



end
