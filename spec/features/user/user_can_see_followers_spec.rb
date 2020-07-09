require 'rails_helper'

describe 'User Dashboard' do
  it 'displays users repos' do
    user = create(:user, github_token: ENV["GITHUB_ACCESS_TOKEN"])

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    within('.followers') do
      expect(page).to have_content("KieraAllen")
    end
  end
end
