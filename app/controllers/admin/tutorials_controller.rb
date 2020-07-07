class Admin::TutorialsController < Admin::BaseController
  def edit
    @tutorial = Tutorial.find(params[:id])
  end

  def create
    @tutorial = Tutorial.new(new_tutorial_params)
    if new_tutorial_params[:playlist_id].nil? || @tutorial.save
      flash[:success] = "Successfully created tutorial"
      redirect_to "/tutorials/#{@tutorial.id}"
    elsif new_tutorial_params[:playlist_id].nil?
      flash[:error] = @tutorial.errors.full_messages.to_sentence
      render :new
    else 
      redirect_to "/admin/dashboard"
      flash[:notice] = "Successfully created tutorial.#{view_context.link_to("View it here.", "/tutorials/#{@tutorial.id}")}"
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
    params.require(:tutorial).permit(:tag_list, :title, :description, :thumbnail)
  end

  def new_tutorial_params
        params.permit(:tag_list, :title, :description, :thumbnail, :playlist_id)
  end 
end
