module Geteable
  extend ActiveSupport::Concern

  def git_hub_info
    url = "https://api.github.com/users/#{ENV['GITHUB_USER']}"
    response = Faraday.get(url)

    if response.status == 200
      response.body
    else

    end
  end


end