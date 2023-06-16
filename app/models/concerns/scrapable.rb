module Scrapable
  extend ActiveSupport::Concern

  included do
    USER = ENV['GITHUB_USER']
    GITHUB_TOKEN = ENV['GITHUB_TOKEN']

    def scrape
      delete_existing_repos

      url = "https://github.com/#{USER}"
      response = make_graphql_post_request(pinned_query)

      result = JSON.parse(response.body)
      pinned_repos = result.dig('data', 'user', 'pinnedItems', 'nodes')

      pinned_repos.each do |repo|
        puts "Name: #{repo['name']}"
        puts "Description: #{repo['description']}"
        puts "---------------------------"
      end
    end

    private

    def delete_existing_repos
      Repo.delete_all if repos_present?
    end

    def repos_present?
      self.repos.present?
    end

    def make_graphql_post_request(query)
      conn = Faraday.new(url: 'https://api.github.com/graphql') do |faraday|
        faraday.headers['Authorization'] = "bearer #{GITHUB_TOKEN}"
        faraday.adapter Faraday.default_adapter
      end

      conn.post { |req| req.body = { query: query }.to_json }
    end

    def pinned_query
      <<~GRAPHQL
        {
          user(login: "#{USER}") {
            pinnedItems(first: 6, types: REPOSITORY) {
              nodes {
                ... on Repository {
                  name
                  description
                }
              }
            }
          }
        }
      GRAPHQL
    end
  end
end
