class Admin::PlaylistsController < Admin::BaseController

  def new
  end

  def create
    # tutorial = Tutorial.new(playlist_params)
    json = YoutubeService.new.playlist_info(params[:playlist_id])
    video_params = {}
    json[:items].each do |video_data|
      video_params[:id] = video_data[:id]
      video_params[:title] = video_data[:snippet][:title]
      video_params[:description] = video_data[:snippet][:description]
      video_params[:thumbnail] = video_data[:snippet][:thumbnails][:default]
    end

    tutorial = Tutorial.create(video_params)

    if tutorial.save
      flash[:notice] = "Successfully created tutorial. #{view_context.link_to("View it here", tutorial_path(tutorial.id))}"
      redirect_to admin_dashboard_path
    else
      flash[:error] = tutorial.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def playlist_params
    params.permit(:title, :description, :playlist_id, :thumbnail)
  end
end
