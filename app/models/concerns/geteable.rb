module Geteable
  extend ActiveSupport::Concern

  included do
    def git_hub_info
      url = "https://api.github.com/users/#{ENV['GITHUB_USER']}"
      response = Faraday.get(url)

      if response.status == 200
        response.body
      else
        User.first
      end
    end
  end
end
