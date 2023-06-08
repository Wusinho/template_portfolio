module Geteable
  extend ActiveSupport::Concern

  def git_hub_info
    url = "https://api.github.com/users/#{ENV['GITHUB_USER']}"
    # response = Faraday.get(url)

    heber_lazo = {
      "login": "Wusinho",
      "id": 67179149,
      "node_id": "MDQ6VXNlcjY3MTc5MTQ5",
      "avatar_url": "https://avatars.githubusercontent.com/u/67179149?v=4",
      "gravatar_id": "",
      "url": "https://api.github.com/users/Wusinho",
      "html_url": "https://github.com/Wusinho",
      "followers_url": "https://api.github.com/users/Wusinho/followers",
      "following_url": "https://api.github.com/users/Wusinho/following{/other_user}",
      "gists_url": "https://api.github.com/users/Wusinho/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/Wusinho/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/Wusinho/subscriptions",
      "organizations_url": "https://api.github.com/users/Wusinho/orgs",
      "repos_url": "https://api.github.com/users/Wusinho/repos",
      "events_url": "https://api.github.com/users/Wusinho/events{/privacy}",
      "received_events_url": "https://api.github.com/users/Wusinho/received_events",
      "type": "User",
      "site_admin": false,
      "name": "H Lazo",
      "company": "heberlazo@gmail.com",
      "blog": "",
      "location": "Lima-Peru",
      "email": nil,
      "hireable": true,
      "bio": "Full-Stack Developer with knowledge in HTML, CSS, and Javascript. Always looking for new challenges, and just for a short time Available to hire.",
      "twitter_username": "HeberLazo1",
      "public_repos": 99,
      "public_gists": 0,
      "followers": 15,
      "following": 30,
      "created_at": "2020-06-20T03:59:49Z",
      "updated_at": "2023-06-07T16:16:12Z"
    }

    # if response.status == 200
    #   heber_lazo
    # else
    # end
  end


end