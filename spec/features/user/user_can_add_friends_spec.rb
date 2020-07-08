require 'rails_helper'

describe "User Has Friends through Github" do
  it "can add friends" do
    # json_response = File.read('spec/fixtures/melanies_followers.json')
    # stub_request(:get, "https://api.github.com/user/followers").
    # to_return(status: 200, body: json_response)
    user1 = create(:user, github_token: ENV['GITHUB_MEL_TOKEN'], github_username: "melatran")
    user2 = create(:user, github_token: ENV['GITHUB_ACCESS_TOKEN'], github_username: "sagemlee")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit dashboard_path

    within ".friends" do
      expect(page).to have_content("You have no friends.")
    end

    within ".followers" do
      expect(page).to have_content("sagemlee")
      click_link "Add Friend"
    end

    expect(page).to have_content("You have a new friend.")
    expect(current_path).to eq("/dashboard")

    within ".friends" do
      expect(page).to have_content("sagemlee")
    end
  end
end
