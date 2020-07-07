class Admin::PlaylistsController < Admin::BaseController

  def new
  end

  def create
    tutorial = Tutorial.new(playlist_params)
    tutorial.save
    playlist_data = YoutubeService.new.playlist_info(params[:playlist_id])
    playlist_data[:items].each do |video_data|
      video_params = {
        :id => video_data[:id],
        :title => video_data[:snippet][:title],
        :description => video_data[:snippet][:description],
        :thumbnail => video_data[:snippet][:thumbnails][:default]
      }
      bob = Video.create(video_params)
    end
      flash[:notice] = "Successfully created tutorial. #{view_context.link_to("View it here", tutorial_path(tutorial.id))}"
      redirect_to admin_dashboard_path
  end

  private

  def playlist_params
    params.permit(:title, :description, :playlist_id, :thumbnail)
  end
end
