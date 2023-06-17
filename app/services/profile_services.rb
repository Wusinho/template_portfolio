
class ProfileServices
  def self.fetch_user_info
    response = make_graphql_post_request(pinned_query)
    if response.status == 200
      result = JSON.parse(response.body)
      result['data']
      # Process the result and extract the required information
    else
      # Handle the error case
    end
  end

  def self.make_graphql_post_request(query)
    conn = Faraday.new(url: 'https://api.github.com/graphql') do |faraday|
      faraday.headers['Authorization'] = "Bearer #{github_token}"
      faraday.adapter Faraday.default_adapter
    end

    conn.post { |req| req.body = { query: query }.to_json }
  end

  def self.pinned_query
    <<~GRAPHQL
      query User {
        user(login: "#{github_user}") {
          name
          bio
          avatarUrl
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

  def self.github_user
    ENV['GITHUB_USER']
  end

  def self.github_token
    ENV['GITHUB_TOKEN']
  end
end
