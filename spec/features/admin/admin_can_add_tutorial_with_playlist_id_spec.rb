require 'rails_helper'

describe "An Admin can add tutorial " do
  let(:admin)    { create(:admin) }

  scenario "by using youtube playlist id", :js do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit '/admin/tutorials/new'
    click_on 'Import YouTube Playlist'
    fill_in :playlist_id, with: "PLpTHBOOvs-f2WJBInFYq1g-TxmG250HQ-"
    click_on 'Submit'
    
    expect(current_path).to eq('/admin/dashboard')
    save_and_open_page
    expect(page).to have_content('Successfully created tutorial. View it here.')
    click_on 'View it here'

    expect(current_path).to eq('/tutorials/:id')
    expect(page).to have_content("Tying Shoe Laces Song")
    expect(page).to have_content("EASIEST Way To Teach Your Kid How To Tie Shoes!!!")
    expect(page).to have_content("How to Tie a Shoe Step by Step")
    expect(page).to have_content("Tying Shoes Chuldren's Song")
  end 
end
# As an admin
# When I visit '/admin/tutorials/new'
# Then I should see a link for 'Import YouTube Playlist'
# When I click 'Import YouTube Playlist'
# Then I should see a form

# And when I fill in 'Playlist ID' with a valid ID
# Then I should be on '/admin/dashboard'
# And I should see a flash message that says 'Successfully created tutorial. View it here.'
# And 'View it here' should be a link to '/tutorials/:id'
# And when I click on 'View it here'
# Then I should be on '/tutorials/:id'
# And I should see all videos from the YouTube playlist
# And the order should be the same as it was on YouTube