require 'uri'

class Repo < ApplicationRecord
  belongs_to :user

  def repo_info
    url = "https://raw.githubusercontent.com/#{ENV['GITHUB_USER']}/#{name}/master/README.md"
    response = Faraday.get(url)
    doc = Nokogiri::HTML(response.body)
    removed_unnecessary_readme = extract_description(doc.text)
    encoded_uri = URI.encode_www_form_component(removed_unnecessary_readme)
    api_url = "https://helloacm.com/api/markdown/?cached&s=#{encoded_uri}"
    resp = Faraday.get(api_url)
    remove_newlines(resp.body)

  end

  def remove_newlines(string)
    string.gsub(/\\n/, '').gsub(/\\/, '').gsub(/"/, '')
  end

  def encode_uri(uri)
    URI.encode(uri)
  end

  def extract_description(mark_down_readme)
    end_point_index = mark_down_readme.index('### **Endpoints of API**')
    description = end_point_index.nil? ? mark_down_readme : mark_down_readme[0...end_point_index]
    description.strip
  end



end
