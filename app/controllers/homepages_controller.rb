class HomepagesController < ApplicationController
  before_action :github_information, only: [:index]
  def index
    @time = Time.now
  end

  private

  def github_information
    @user = User.find_or_create_by(id: 1)
    @github = JSON.parse(@user.update_user)

    @cv = ENV['GOOGLE_CV']
  end



end
