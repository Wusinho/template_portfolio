class Repo < ApplicationRecord
  belongs_to :user

  def repo_info
    url = "https://github.com/#{ENV['GITHUB_USER']}/#{name}/blob/master/README.md"
    response = Faraday.get(url)

    doc = Nokogiri::HTML(response.body)
    doc.css('p img').first['src']

  end
end
