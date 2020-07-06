class SearchResults

  def repos
    json = GithubService.new.list_repos
    @repos = json[0..4].map do |user_data|
     Repo.new(user_data)
    end
  end

  def followers
    json = GithubService.new.list_followers
    @followers = json.map do |user_data|
      Follower.new(user_data)
    end
  end

  def followings
    json = GithubService.new.list_followings
    @followings = json.map do |user_data|
      Following.new(user_data)
    end
  end

  # def playlists
  #   json = YoutubeService.new.playlist_info(playlist_id)
  #   @playlist = json.map do |video|
  #     require "pry";binding.pry
  #   end
  # end
end
