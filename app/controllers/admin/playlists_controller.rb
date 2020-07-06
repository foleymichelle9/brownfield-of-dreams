class Admin::PlaylistsController < Admin::BaseController

  def new
  end

  def create
    @tutorial = Tutorial.new(playlist_params)
    json = YoutubeService.new.playlist_info(params[:playlist_id])
    @videos = json[:items].map do |video|
      require "pry";binding.pry
    end

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
