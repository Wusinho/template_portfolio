class ScrapperServices
  def self.call
    url = "https://raw.githubusercontent.com/#{ENV['GITHUB_USER']}/#{ENV['GITHUB_USER']}/main/README.md"

    response = Faraday.get(url)

    if response.status == 200
      p url
      doc = Nokogiri::HTML(response.body)
      profile = doc.css('.profile__container p')

    else

    end

  end

end