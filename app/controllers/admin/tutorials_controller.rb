class Admin::TutorialsController < Admin::BaseController
  def edit
    @tutorial = Tutorial.find(params[:id])
  end

  def create
    @tutorial = Tutorial.create!(new_tutorial_params)
    @tutorial.save
    #tutorial = Tutorial.find(params[:tutorial_id])

    if new_tutorial_params[:playlist_id].nil? && @tutorial.save
      flash[:success] = "Successfully created tutorial"
      redirect_to "/tutorials/#{@tutorial.id}"
    elsif new_tutorial_params[:playlist_id].nil?
      flash[:error] = @tutorial.errors.full_messages.to_sentence
      render :new
    else 
      redirect_to "/admin/dashboard"
      flash[:notice] = %Q[Successfully created tutorial.<a href="/tutorials/#{@tutorial.id}">View it here.</a>].html_safe
      playlist_data = YoutubeService.new.playlist_info(new_tutorial_params[:playlist_id])
      video_params = {}
      playlist_data[:items].each do |data| 
        video_params[:id] = data[:id]
        video_params[:title] = data[:snippet][:title]
        video_params[:description] = data[:snippet][:description]
        video_params[:thumbnail] = data[:snippet][:thumbnails][:default]
        video_params[:tutorial_is] = @tutorial.id
      end 
    end
  end

  def new
    @tutorial = Tutorial.new
  end

  def update
    tutorial = Tutorial.find(params[:id])
    if tutorial.update(tutorial_params)
      flash[:success] = "#{tutorial.title} tagged!"
    end
    redirect_to edit_admin_tutorial_path(tutorial)
  end

  def destroy
    tutorial = Tutorial.find(params[:id])
    flash[:success] = "#{tutorial.title} tagged!" if tutorial.destroy
    redirect_to admin_dashboard_path
  end

  private

  def tutorial_params
    params.require(:tutorial).permit(:tag_list, :title, :description, :playlist_id)
  end

  def new_tutorial_params
        params.require(:tutorial).permit(:tag_list, :title, :description, :thumbnail, :playlist_id)
  end 
end
