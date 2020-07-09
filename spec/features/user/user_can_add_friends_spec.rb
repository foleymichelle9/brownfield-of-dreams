require 'rails_helper'

describe "User Has Friends through Github" do
  it "can not add a friend if user does not have account" do
    user1 = create(:user, github_token: ENV['GITHUB_ACCESS_TOKEN'], github_username: "sagemlee")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit dashboard_path

    within ".friends" do
      expect(page).to have_content("You have no friends.")
    end

    within "#following-melatran" do
      expect(page).to have_content("melatran")
      expect(page).to_not have_content("Add Friend")
    end
  end

  # it "can add friend if they have an account" do
  #   user1 = create(:user, github_token: ENV['GITHUB_MEL_TOKEN'], github_username: "melatran")
  #   user2 = create(:user, github_token: ENV['GITHUB_ACCESS_TOKEN'], github_username: "sagemlee")
  #   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
  #
  #   stub_omniauth
  #
  #   visit "/dashboard"
  #   click_link "Connect to GitHub"
  #
  # end
end
