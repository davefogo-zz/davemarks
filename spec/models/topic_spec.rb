require 'rails_helper'

RSpec.describe Topic, type: :model do
  let(:topic) {create(:topic)}

  it {is_expected.to belong_to(:user)}
  it {is_expected.to have_many(:bookmarks)}
end
