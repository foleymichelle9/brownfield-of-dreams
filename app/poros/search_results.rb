class SearchResults

  def initialize(token)
    @token = token
  end

  def github_service(token)
    GithubService.new(@token)
  end

  def repos
    data = github_service(@token).list_repos
    @repos = data[0..4].map do |user_data|
     Repo.new(user_data)
    end
  end

  def get_email_and_name(github_username, github_token)
    github_service = GithubService.new(github_token)
    response = github_service.github_email_and_name(github_username, github_token)
    [response[:email], response[:name]]
  end

  def followers
  data = github_service(@token).list_followers
    @followers = data.map do |user_data|
      Follower.new(user_data)
    end
  end

  def followings
    data = github_service(@token).list_followings
    @followings = data.map do |user_data|
      Following.new(user_data)
    end
  end
end
