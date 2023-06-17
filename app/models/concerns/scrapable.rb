module Scrapable
  extend ActiveSupport::Concern

  included do


    def scrape

      response = make_graphql_post_request(pinned_query)

      result = JSON.parse(response.body)
      pinned_repos = result.dig('data', 'user', 'pinnedItems', 'nodes')

      pinned_repos.each do |repository|
        repo = Repo.find_by_name(repository['name'])
        if repo.present?
          repo.update(summary: repository['description'])
        else
          self.repos.create(name: repository['name'], summary: repository['description'])
        end
      end
      pinned_repos_names = pinned_repos.map { |repo| repo['name'] }
      unpinned_repos = Repo.where.not(name: pinned_repos_names)
      unpinned_repos.destroy_all
    end

    private

    def github_user
       ENV['GITHUB_USER']
    end

    def github_token
      ENV['GITHUB_TOKEN']
    end

    def repos_present?
      self.repos.present?
    end

    def make_graphql_post_request(query)
      conn = Faraday.new(url: 'https://api.github.com/graphql') do |faraday|
        faraday.headers['Authorization'] = "bearer #{github_token}"
        faraday.adapter Faraday.default_adapter
      end

      conn.post { |req| req.body = { query: query }.to_json }
    end

    def pinned_query
      <<~GRAPHQL
        {
          user(login: "#{github_user}") {
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
