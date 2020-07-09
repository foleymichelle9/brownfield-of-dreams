class GithubService

  def initialize(token)
    @token = token
  end

  def list_repos
    get_url("repos")
  end

  def list_followers
    get_url("followers")
  end

  def list_followings
    get_url("following")
  end

  def github_username(token)
    params = { access_token: token }

    get_json("/user", params)
  end

  def github_email_and_name(github_username, token)
    params = { access_token: token }

    get_json("/users/#{github_username}", params)
  end

  private

  def get_url(url)
    response = conn.get("/user/#{url}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new("https://api.github.com") do |req|
      req.adapter Faraday.default_adapter
      req.headers["Authorization"] = "token #{@token}"
    end
  end
end
