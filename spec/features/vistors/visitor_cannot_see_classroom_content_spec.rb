require 'rails_helper'

describe 'visitor visits video show page' do
  it 'Cannot see tutorials labeled classroom content' do
    tutorial = create(:tutorial)

  end
end

#
# Currently all tutorials are visible to anyone.
# We want to make tutorials marked as "classroom content" viewable
# only if the user is logged in.
#
# The tutorials table has a boolean column for
# classroom that should be used for this story.
