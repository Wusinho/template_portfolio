module Scrapable
  extend ActiveSupport::Concern

  included do
    def scrape
      Repo.delete_all if self.repos.present?
      url = "https://github.com/#{ENV['GITHUB_USER']}"
      response = Faraday.get(url)

      doc = Nokogiri::HTML(response.body)
      summary = doc.css('.pinned-item-desc').map { |span| span.content}.map(&:strip)
      name = doc.css('.repo').map { |span| span.content}
      summary.length.times { |i| self.repos.create(name: name[i], summary: summary[i]) }
    end
  end

end
