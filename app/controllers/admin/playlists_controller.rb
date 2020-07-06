class Admin::PlaylistsController < Admin::BaseController

  def new
  end

  def create
    @tutorial = Tutorial.new(playlist_params)
    #some json activity
    #use searchresults method to get playlist info
    #make new youtuberesults? that reaches into YoutubeService(API) to grab videos and find playlist - Use tutorial object?
    #first Youtube service...get playlist_info
    if @tutorial.save
      flash[:success] = "Successfully created tutorial. View it here"
      redirect_to dashboard_path
    else
      flash[:error] = @tutorial.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def playlist_params
    params.permit(:title, :description, :playlist_id)
  end
end
