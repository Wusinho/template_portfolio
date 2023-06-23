class Repo < ApplicationRecord
  belongs_to :user

  def self.repo_info(name)
    readme_response = readme(name)

    readme_text = remove_unnecessary_content(readme_response)
    encoded_readme = URI.encode_www_form_component(readme_text)
    markdown_response = sanitize_mark_down(encoded_readme)
    remove_special_characters(markdown_response)
  end

  def self.readme(name)
    readme_url = "https://raw.githubusercontent.com/#{github_user}/#{name}/master/README.md"
    send_request(readme_url)
  end

  private

  def self.sanitize_mark_down(encoded_readme)
    markdown_api_url = "https://helloacm.com/api/markdown/?cached&s=#{encoded_readme}"
    send_request(markdown_api_url)
  end

  def self.send_request(url)
    response = Faraday.get(url)
    if response.status == 200
      response.body
    else
      raise StandardError, "Request to #{url} failed with status code #{response.status}"
    end
  end

  def self.remove_unnecessary_content(readme)
    end_point_index = readme.index('## Description of the Project')
    description = end_point_index.nil? ? readme : readme[0...end_point_index]
    description.strip
  end

  def self.remove_special_characters(string)
    string.gsub(/\\n/, '').delete('\\').delete('"')
  end

  private

  def self.github_user
    ENV['GITHUB_USER']
  end
end

