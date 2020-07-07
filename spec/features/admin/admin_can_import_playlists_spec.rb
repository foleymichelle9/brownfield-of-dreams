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

    expect(page).to have_content("Successfully created tutorial.")

    click_on "View it here"
    # expect(current_path).to eq(tutorial_path(tutorial))
    expect("The Creepy Real-Life “Men In Black”").to appear_before("The Secret Society Of The Illuminati")
    expect("The Secret Society Of The Illuminati").to appear_before("3 Horrifying Cases Of Ghosts And Demons")
    expect("3 Horrifying Cases Of Ghosts And Demons").to appear_before("The Chilling Exorcism Of Anneliese Michel")
    expect("The Chilling Exorcism Of Anneliese Michel").to appear_before("The Bizarre Toxic Death Of Gloria Ramirez")
  end

  scenario "Admin can import youtube playlist with more than 50 videos" do
    visit new_admin_playlist_path

    fill_in :playlist_id, with: "PLD8iUdp33PqSmH4NjDm6lk1YiNUhLCxj4"
    fill_in :title, with: "BuzzFeed Unsolved SuperNatural"
    fill_in :description, with: "Hey There Demons"
    fill_in :thumbnail, with: "Thumbnail"

    click_on "Save"
    expect(current_path).to eq("/admin/dashboard")

    expect(page).to have_content("Successfully created tutorial.")

    click_on "View it here"
  end
end
