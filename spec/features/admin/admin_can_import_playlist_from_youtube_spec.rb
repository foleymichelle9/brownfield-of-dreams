require 'rails_helper'

RSpec.describe "As an Admin" do
  before :each do
    admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  end
  it "I can import a playlist from YouTube", :vcr do
      visit "/admin/tutorials/new"

      click_on "Import YouTube Playlist"
  end 
end
