require 'rails_helper'

describe "Admin Tutorials" do
  before :each do
    admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  end

  it "Displays the Import Youtube Playlist Button" do
    visit new_admin_tutorial_path
    expect(page).to have_content("Import YouTube Playlist")
  end

  scenario "Admin can import youtube playlist" do

    visit new_admin_playlist_path

    fill_in :playlist_id, with: "PLD8iUdp33PqSmH4NjDm6lk1YiNUhLCxj4"
    fill_in :title, with: "BuzzFeed Unsolved SuperNatural"
    fill_in :description, with: "Hey There Demons"
    fill_in :thumbnail, with: "Thumbnail"

    click_on "Save"
    expect(current_path).to eq("/admin/dashboard")
    expect(page).to have_content("Successfully created tutorial. View it here")

    click_on "View it here"

  end
end


# As an admin
# When I visit '/admin/tutorials/new'
# Then I should see a link for 'Import YouTube Playlist'
# When I click 'Import YouTube Playlist'
# Then I should see a form
#
# And when I fill in 'Playlist ID' with a valid ID
# Then I should be on '/admin/dashboard'
# And I should see a flash message that says 'Successfully created tutorial. View it here.'
# And 'View it here' should be a link to '/tutorials/:id'
# And when I click on 'View it here'
# Then I should be on '/tutorials/:id'
# And I should see all videos from the YouTube playlist
# And the order should be the same as it was on YouTube
