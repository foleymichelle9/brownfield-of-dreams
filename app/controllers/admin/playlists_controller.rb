class Admin::PlaylistsController < Admin::BaseController
  def new
    @tutorial = Tutorial.new(title: "Something", description: "something", thumbnail: "something")
    #@playlist_data = YoutubeService.new.playlist_info(id)
  end

private
  def playlist_params 
    params.permit(title: "Something", description: "something", thumbnail: "something")
  end 
end
