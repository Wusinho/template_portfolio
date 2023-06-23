class ScrapperServices
  def self.call
    url = "https://raw.githubusercontent.com/#{ENV['GITHUB_USER']}/#{ENV['GITHUB_USER']}/main/README.md"

    response = Faraday.get(url)

    if response.status == 200

      doc = Nokogiri::HTML(response.body)
      paragraphs = doc.css('.profile__container p').map { |p_tag| p_tag.to_html }
      shields = doc.css('.shields__container')

      tech_names = shield_collect_url(shields).compact

      return {
        paragraphs: paragraphs,
        shields: tech_names
      }


    else

    end

  end

  private

  def self.shield_collect_url(shields)
    shields_urls = []
    shields.each do |shield|
      shield_content = shield.text
      urls = shield_content.scan(/\!\[\]\((.*?)\)/).flatten
      shields_urls.concat(urls)
    end

    shields_urls.map { |url| rename_icons(extract_tech_from_url(url)&.downcase)}
  end

  def self.extract_tech_from_url(url)
    match = url.match(/badge\/(.*?)-informational/)
    match[1] if match
  end

  def self.rename_icons(name)
    return if list_no_icons.include?(name)

    other_icons = {
      aws: 'fa-brands fa-aws',
    }
    if other_icons.keys.include?(name.to_sym)
      other_icons[name.to_sym]
    else
      "devicon-#{name}-plain"
    end
  end

  def self.list_no_icons
    ['postman']
  end

end