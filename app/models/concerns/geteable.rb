module Geteable
  extend ActiveSupport::Concern

  included do
    def git_hub_info
      response = make_graphql_post_request(pinned_query)
      if response.status == 200
        result = JSON.parse(response.body)
      else

      end

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
           query User {
            user(login: "#{github_user}") {
                bio
                login
                pinnedItems(first: 6, types: REPOSITORY) {
                    nodes {
                        ... on Repository {
                            name
                            description
                            openGraphImageUrl
                            url
                        }
                    }
                }
                socialAccounts(first: 4) {
                    nodes {
                        displayName
                        provider
                        url
                    }
                }
            }
        }
      GRAPHQL
    end

    private

    def github_user
      ENV['GITHUB_USER']
    end

    def github_token
      ENV['GITHUB_TOKEN']
    end


  end
end
