require 'rails_helper'

RSpec.describe Topic, type: :model do
  let(:topic) {create(:topic, title: " --\r\nCompany " )}

  it {is_expected.to belong_to(:user)}
  it {is_expected.to have_many(:bookmarks)}

  describe "#clean_up" do
    it "compares the correct bookmark" do
      expect(topic.title).to eq(" --\r\nCompany ")
    end

    it "cleans up the title in a topic" do
      stripped_topic = topic.clean_up
      d = "Company"
      expect(stripped_topic).to eq(d)
    end
  end
end
