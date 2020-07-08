require 'rails_helper'

describe "User can connect to github" do
  scenario "using oauth github" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    stub_omniauth

    visit "/dashboard"
    click_link "Connect to GitHub"

    expect(user.github_token).to eq stub_omniauth[:credentials][:token]
  end
end
