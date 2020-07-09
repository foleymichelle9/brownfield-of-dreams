require 'rails_helper'

describe "User Has Friends through Github" do
  it "can add friends" do
    user1 = create(:user, github_token: ENV['GITHUB_MEL_TOKEN'], github_username: "melatran")
    user2 = create(:user, github_token: ENV['GITHUB_ACCESS_TOKEN'], github_username: "sagemlee")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit dashboard_path

    within ".friends" do
      expect(page).to have_content("You have no friends.")
    end

    within ".following-sagemlee" do
      expect(page).to have_content("sagemlee")
      click_on 'Add Friend'
    end

    # expect(page).to have_content("You have a new friend.")
    # expect(current_path).to eq("/dashboard")
    #
    # within ".friends" do
    #   expect(page).to have_content("sagemlee")
    # end
  end
end
